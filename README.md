# CodiciMatlab
Codici matlab per la tesi:
## PeanoCurve(n, part_type)
Codice scaricato da https://it.mathworks.com/matlabcentral/fileexchange/62381-peanocurve-n, restituisce le coordinate dalla (n-1)-esima iterazione tramite conti che sfruttano l'autosimilarità. Part_type indica il tipo di partizione: 
1) i/3^2k 
2) 1/(2*3^2k)+i/3^2k
(Le partizioni devono rispettare la "simmetria")

## Testing
Script che disegna due grafici: i valori ottenuti integrando la funzione in yfunc con derivata dyfunc come integrale di Young e Rough rispettivamente. I risultati vengono rappresentati variando il tipo di partizione ed il numero di iterazioni.

## Integraleopt(y,dy,t,k,int_type,part_type)
Funzione che calcola il valore dell'integrale per la funzione y da 0 a t lungo la curva di Peano, tramite i seguenti parametri:
- y: funzione da integrare.
- dy: differenziale di y da applicare a Gamma.
- t: integrale tra 0 e t.
- k: iterazione della partizione da considerare.
- int_type: 'y' per Young, 'r' per Rough.
- part_type: 1,2,3 in base al tipo di partizione scelto.

