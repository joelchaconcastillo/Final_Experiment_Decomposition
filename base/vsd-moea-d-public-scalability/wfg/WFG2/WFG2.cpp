/***********************************************************************************
 * AUTORES
 *   - Eduardo Manuel Segredo Gonzalez
 * 
 * FECHA
 *   Julio de 2008
 *
 * *********************************************************************************/

#include <vector>
#include <math.h>

#include "WFG2.h"
using namespace std;
// Constantes y variables estaticas
const double PI = 3.1415926535897932384626433832795;
int WFG2::k;

// Inicializacion del problema
bool WFG2::init (int nObj) {
	this->nObj = nObj;

	// Inicializa los parametros del problema

	if (nObj < 2) {
	  cout << "Error WFG2: Parameter number_of_objectives must be greater than 2" << endl;
		return false;
	}

	if (nObj >= 3)
    k = 2 * (nObj - 1);
	else
	  k = 4;
	k = 4;
	this->nVar = k + l;
//  setNumberOfVar(k + l);  // Parametros de posicion + Parametros de distancia
//	setNumberOfObj(nObj);   // Numero de objetivos
	return true;
}

// Evaluacion de un individuo WFG2
void WFG2::evaluate (vector<double> &X, vector<double> &Obj) {

	// Inicializa el vector y
	 vector<double> y = WFG_normalise_z( X );
//	for (int i = 0; i <  this->nVar ;i++)
//	  y.push_back(X[i]);

	// Aplica las transiciones al vector y
	y = WFG2_t1(y, k);
	y = WFG2_t2(y, k);
	y = WFG2_t3(y, k, this->nObj);

	// Calcula los valores de las funciones objetivo
	Obj = WFG2_shape(y);

	// Fija dichos valores
//	for (int i = 0; i < result.size(); i++)
//	  setObj(i, result[i]);

}
				
// Clonacion de un individuo WFG2
//Individual* WFG2::clone (void) const {
//	return new WFG2();
//}

/******************************************************************************
 * Funciones auxiliares al problema
 * ****************************************************************************/

// Escala un valor al intervalo [0, 1]
double WFG2::correct_to_01 (const double &a, const double &epsilon) {

  const double min = 0.0;
	const double max = 1.0;

	const double min_epsilon = min - epsilon;
	const double max_epsilon = max + epsilon;

  if ((a <= min) && (a >= min_epsilon)) {
	  return min;
 	}
  else if ((a >= max) && (a <= max_epsilon)) {
    return max;
  }
  else {
    return a;
	}
}

// Construye un vector con los elementos v[head], ..., v[tail - 1]
vector<double> WFG2::subvector (const vector<double> &v, const int head, const int tail) {

  vector< double > result;

	for(int i = head; i < tail; i++) {
    result.push_back(v[i]);
 	}

  return result;
}

vector<double> WFG2::calculate_x (const vector<double> &t_p, const vector<short> &A) {

  vector<double> result;

	for (int i = 0; i < t_p.size() - 1; i++) {
		const double tmp1 = max<double>(t_p.back(), A[i]);
	 	result.push_back(tmp1 * (t_p[i] - 0.5) + 0.5); 
	}
 
 	result.push_back(t_p.back());
	return result;
}

vector<double>  WFG2::calculate_f (const double &D, const vector<double> &x, const vector<double> &h,
                                   const vector<double> &S) {

  vector< double > result;

  for (int i = 0; i < h.size(); i++) {
    result.push_back(D * x.back() + S[i] * h[i]);
  }

  return result;
}

/******************************************************************************
 * Transiciones genericas
 * ****************************************************************************/

double WFG2::s_linear (const double &y, const double &A) {
  return correct_to_01(fabs(y - A) / fabs(floor(A - y) + A));
}

double WFG2::r_nonsep(const vector<double> &y, const int A) {

  const int y_len = y.size();
  double numerator = 0.0;

  for (int j = 0; j < y_len; j++) {
    numerator += y[j];
    for(int k = 0; k <= A - 2; k++) {
      numerator += fabs(y[j] - y[(j + k + 1) % y_len]);
    }
  }
  
	const double tmp = ceil(A / 2.0);
  const double denominator = y_len *tmp * (1.0 + 2.0 * A - 2.0 * tmp) / A;

  return correct_to_01(numerator / denominator);
}

double WFG2::r_sum (const vector<double> &y, const vector<double> &w) {

  double numerator   = 0.0;
  double denominator = 0.0;

  for(int i = 0; i < y.size(); i++) {
	  numerator   += w[i] * y[i];
	  denominator += w[i];
	}

	return correct_to_01(numerator / denominator);
}

/******************************************************************************
 * Superficies genericas
 * ****************************************************************************/

double WFG2::convex (const vector<double> &x, const int m) {

	const int M = x.size();
  double result = 1.0;

  for (int i = 1; i <= M - m; i++) {
	  result *= 1.0 - cos(x[i - 1] * PI / 2.0);
 	}

  if( m != 1 ) {
    result *= 1.0 - sin(x[M - m] * PI/ 2.0);
 	}

  return correct_to_01(result);
}

double WFG2::disc (const vector<double> &x, const int A, const double &alpha, const double &beta) {
  const double tmp1 = A * pow(x[0], beta) * PI;
  return correct_to_01(1.0 - pow(x[0], alpha) * pow(cos(tmp1), 2.0));
}

/******************************************************************************
 * Funciones propias del problema WFG2
 * ****************************************************************************/

// Primera transicion para WFG2
vector<double> WFG2::WFG2_t1 (const vector<double> &y, const int k) {

  const int n = y.size();
  vector<double> t;

  for(int i = 0; i < k; i++) {
    t.push_back(y[i]);
 	}

  for(int i = k; i < n; i++) {
    t.push_back(s_linear(y[i], 0.35));
	}

  return t;

}

// Segunda transicion para WFG2
vector<double> WFG2::WFG2_t2 (const vector<double> &y, const int k) {

  const int n = y.size();
  const int l = n - k;

  vector<double> t;

  for (int i = 0; i < k; i++) {
    t.push_back(y[i]);
	}

  for (int i = k + 1; i <= k + l / 2; i++) {
    const int head = k + 2 * (i - k) - 2;
    const int tail = k + 2 * (i - k);
    t.push_back(r_nonsep(subvector(y, head, tail), 2));
	}

	return t;
}

// Tercera transicion para WFG2
vector<double> WFG2::WFG2_t3 (const vector<double> &y, const int k, const int M) {

  const int n = y.size();
  const vector<double> w(n, 1.0);

  vector<double> t;

  for (int i = 1; i <= M - 1; i++) {
	  const int head = (i - 1) * k / (M - 1);
		const int tail = i * k / (M - 1);

    const vector<double> &y_sub = subvector(y, head, tail);
    const vector<double> &w_sub = subvector(w, head, tail);
    t.push_back(r_sum(y_sub, w_sub));
	}

  const vector<double> &y_sub = subvector(y, k, n);
  const vector<double> &w_sub = subvector(w, k, n);

  t.push_back(r_sum(y_sub, w_sub));

  return t;
}

// Superficie para WFG2
vector<double> WFG2::WFG2_shape (const vector<double> &t_p) {

  const int M = t_p.size();
  const vector<short> &A = WFG_create_A(M, false);
  const vector<double> &x = calculate_x(t_p, A);
  vector<double> h;

  for(int m = 1; m <= M - 1; m++) {
    h.push_back(convex(x, m));
 	}

	h.push_back(disc(x, 5, 1.0, 1.0)); 
												  
	return WFG_calculate_f(x, h);

}

/******************************************************************************
 * Funciones propias de los problemas WFG
 * ****************************************************************************/

// Construye un vector de longitud M - 1 con los valores "1,0,0,..." si
// "degenerate" es verdadero. En otro caso, lo construye con los valores
// "1,1,1,..."
vector<short> WFG2::WFG_create_A (const int M, const bool degenerate) {
    
  if (degenerate) {
    vector<short> A(M - 1, 0);
    A[0] = 1;
    return A;
  }
  else {
    return vector<short>(M - 1, 1);
  }
}

// Calcula los valores de fitness escalados para un problema WFG 
vector<double> WFG2::WFG_calculate_f (const vector< double >& x, const vector< double >& h) {
  
  const int M = h.size();
	vector<double> S; 
	
	for(int m = 1; m <= M; m++) {
    S.push_back(m * 2.0);
 	}

	return calculate_f(1.0, x, h, S);
}
vector< double > WFG2::WFG_normalise_z( const vector< double >& z )
{
  vector< double > result;

  for( int i = 0; i < static_cast< int >( z.size() ); i++ )
  {
    const double bound = 2.0*( i+1 );

    result.push_back( z[i] / bound );
  }

  return result;
}
