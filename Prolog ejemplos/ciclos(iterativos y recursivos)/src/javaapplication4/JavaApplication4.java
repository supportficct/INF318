/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication4;

/**
 *
 * @author Miguel
 */
public class JavaApplication4 {
//--------pregunta 1-------------------------    
    public static int sumaEnteros(int n){
    int i = 1, suma=0;
    
    while (i<=n){
        suma = suma +i;
        i++;
    }
    return suma;
    }
    
    //Recursivo
    public static int sumaEnterosRec(int n){
    int suma;
        if (n == 1)
             return n;
        else{
            suma = sumaEnterosRec(n-1) + n;
            return suma;
    }
    }
    
 //--------pregunta 2---------------------------
    public static int sumaPares(int n){
    int i = 1, suma=0;
    
    while (i<=n){
        suma = suma +(i*2);
        i++;
        
    }
    return suma;
    }
    
    //Recursivo
    public static int sumaParesRec(int n){
    int suma;
        if (n == 1)
             return (n*2);
        else{
            suma = sumaParesRec(n-1) + (n*2);
            return suma;
    }
    }
    
//---------------pregunta 3------------------------------
    
    public static int sumaImpares(int n){
    int i = 1, suma=0;
    
    while (i<=n){
        suma = suma +((i*2)-1);
        i++;
        
    }
    return suma;
    }
    
    //Recursivo
    public static int sumaImparesRec(int n){
    int suma;
        if (n == 1)
             return ((n*2)-1);
        else{
            suma = sumaImparesRec(n-1) + ((n*2)-1);
            return suma;
    }
    }
 //--------pregunta 4-------------------------    
    public static int factorial(int n){
    int i = 1, fact=1;
    
    while (i<=n){
        fact = fact*i;
        i++;
    }
    return fact;
    }
    
    //Recursivo
    public static int factorialRec(int n){
    int fact;
        if (n == 0)
            return 0;
        else
            if(n==1)
             return n;
            else{
                fact = factorialRec(n-1) *n;
                return fact;
    }
    }
  //-----------pregunta 5-------------------------
    
    public static int combi(int n, int r){
    return (factorial(n)/(factorial(r)*factorial(n-r)));
    }
           
    //Recursivo
    
    public static int combiRec(int n, int r){
        if (r==0)
            return 1;
        if (n == r)
            return 1;
        else
            return (factorialRec(n)/(factorialRec(r)*factorialRec(n-r)));
    }
    
    
    
    
    //---------prefunta 6--------------------
    public static int sumaCoef(int n){
    int i=0, suma=0;
    while (i<=n)
    {
        suma=suma+(combi(n,i));
        i=i+1;
    }
    return suma;
    }
    
    //Recursivo
    public static int sumaCoefRec(int n, int i){
    if (n==i)
        return (combiRec(n,i));
    else
        return (combiRec(n,i)+sumaCoefRec(n,i+1));
    
    }
    //---------------pregunta 7------------------------
    public static float potencia(int x, int n)
    {
    float i=1, pot=1;
    while (i<=n)
    {
        pot=pot*x;
        i++;
    }
    return pot;
    }
    
    //Recursivo
    
    public static float potenciaRec(int x, int n){
    if (n==0)
        return 1;
    if (n==1)
        return x;
    
    return potenciaRec(x,n-1)* x;
    
    }
      
    //-------pregunta 8 suma-------------------------------
    public static float sumaPot(int x,int n){
    int i=1; 
    float suma=0;
    while (i<=n)
    {
        suma=suma+(potencia(x,i));
        i=i+1;
    }
    return suma;
    }
    
    //Recursivo
    public static float sumaPotRec(int x, int n){
    if (n==0)
        return 1;
    if (n==1)
        return x;
    return sumaPotRec(x,n-1)+potenciaRec(x,n);
    
    }
    
    //-----------pregunta 9---------------------------
    public static void mostrarTabla(int n){
    int i = 1;
    while (i<=n){
        int j = 1;
        while(j<=n){
            System.out.println(i+" x "+j+" = "+(i*j));
        j++;
        }
    i++;
    }
    
    }
    
    //Recursivo
   /* public static void mostrarTablaRec(int i, int n){
    if (i == n)
            System.out.println(i+" x "+n+" = "+(i*n));
    else{
        mostrarTablaRec(i,n-1);
        System.out.println(i+" x "+n+" = "+(i*n));
    }
    mostrarTablaRec(i+1,n);
    }
    */
    //-----------pregunta 10---------------------------
    public static void mostrarFactores(int n){
    int i = 1;
    while (i<=n){
        int j = 1;
        while(j<=n){
            if (i*j == n)
            System.out.println(i+" x "+j+" = "+(i*j));
        j++;
        }
    i++;
    }
    
    
    }
    //Recursivo
    
    //-----------pregunta 11---------------------------
    
    public static int sumaInter(int n){
    int i = 1;
    int suma = 0;
    while(i<=n){
        if ((i % (2)) == 0)
            suma = suma +i;
        else
            suma = suma -i;
    i++;
    }
    return suma;
    }
    //Recursivo
    public static int sumaInterRec(int n){
    if (n==1)
        return -n;
    if (n%2==0)
        return sumaInterRec(n-1)+n;
    else
        return sumaInterRec(n-1)-n;
    
    }
    //-----------pregunta 12---------------------------
    public static float sumaGeom(int n){
    int i = 0;
    float suma =0;
    while (i<=n){
    suma = suma + (1/(float)potencia(2,i));
    i++;
    }
    return suma;
    }
    //Recursivo
    public static float sumaGeomRec(int n){
    if (n==0)
        return (1/potencia(2,n));
    return (sumaGeomRec(n-1) + 1/potencia(2,n));
    
    }
    //-----------pregunta 13---------------------------
    public static float sumaArmonica(int n){
    int i = 1;
    float suma =0;
    while (i<=n){
    suma = suma + (1/i);
    i++;
    }
    return suma;
    }
    //Recursivo
    public static float sumaArmonicaRec(int n){
    if (n==1)
        return (1/potencia(2,n));
    return (sumaArmonicaRec(n-1) + 1/potencia(2,n));
    
    }
    
    //-----------pregunta 14---------------------------
    public static float sumaAlterna(int n){
    int i = 1;
    float suma =0;
    while (i<=n){
    suma = suma + (potencia(-1, i+1)*1/i);
    i++;
    }
    return suma;
    }
    //Recursivo
    public static float sumaAlternaRec(int n){
    if (n==1)
        return (potencia(-1, n+1)*1/n);
    return (sumaAlternaRec(n-1) + (potencia(-1, n+1)*1/n));
    
    }
    //-----------pregunta 15---------------------------
    public static int sumaCuadrados(int n){
    int i = 1, suma =0;
    while (i<=n){
    suma = suma + i*i;
    i++;
    }
    return suma;
    }
    //Recursivo
    public static int sumaCuadradosRec(int n){
    if (n==1)
        return (n*n);
    return (sumaCuadradosRec(n-1) + (n*n));
    
    }
    
    //-----------pregunta 16---------------------------
    public static int sumaEscalada(int n){
    int i=1, suma=0;
    while (i<=n){
        int j=1;
        while (j<=i){
            suma=suma+j;
            j=j+1;
        }
        i=i+1;    
    }
        return suma;
    }
    //Recursivo
    
    public static int sumaEscaladaRec(int n,int i){
    int s=0 ;
        if (i==n)
        return n;
        
    s = s+ escalada(n,i,0);
    return s + sumaEscaladaRec(n,i+1);
    }
    
    public static int escalada(int n, int j, int s){
    if (j==n)
        return j;
    s = escalada(n,j+1,s);
    return (s+j);
    }
    //-----------pregunta 17---------------------------
    public static float sumaPicuartos(int n){
    int i=1; 
    float suma=0;
    while (i<=n){
        suma= suma + (potencia((-1), (i+1)))*(1/((2*(float)i)-1));
        i++;
    }
        return suma;
    
    }
            
            
            //Recursivo
    
    //-----------pregunta 18---------------------------
    public static int sumaProducto(int n){
        int i=1, suma=0;
        while(i<=n){
            int j=i;
            while(j<=n){
                suma=suma+i*j;
                j=j+1;
            }
        i=i+1;
        }
    return suma;
    }
    
    
    
    
    
    
    //Recursivo
    
    //-----------pregunta 19---------------------------
    public static float sumaExpon(int x,int n){
    int i=0;
    float suma=0;
    while(i<=n){
        suma =suma+(potencia(x, i) /factorial(i));
        i=i+1;
    }
    return suma;
    }
        
    
    
    
    
    //Recursivo
    
    //-----------pregunta 20---------------------------
    
    public static float sumaSeno(int x,int n){
    int i=0;
    float suma=0;
    while (i<=n){
        suma+= (potencia((-1),i)/(factorial(2*i+1)))*potencia(x, (2*i+1));
        i=i+1;
    
    }
    return suma;
    }
    
    //Recursivo
    public static float sumaCoseno(int x, int n){
    int i=0;
    float suma=0;
    while (i<=n) {
        suma+=potencia((-1), i)/(factorial(2*i))*potencia(x, 2*i);
        i++;
    
    }
    return suma;
    
    
    }  
    
    
    
    
    
    
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        System.out.println(sumaEnteros(5));
        System.out.println(sumaEnterosRec(5));
        System.out.println(sumaPares(5));
        System.out.println(sumaParesRec(5));
        System.out.println(sumaImpares(5));
        System.out.println(sumaImparesRec(5));
        System.out.println(factorial(5));
        System.out.println(factorialRec(5));
        System.out.println(combi(5,1));
        System.out.println(combiRec(5,1));
        System.out.println(sumaCoef(3));
        System.out.println(sumaCoefRec(3,0));
        System.out.println(potencia(5, 3));
        System.out.println(potenciaRec(5,3));
        System.out.println(sumaPot(4, 3));
        System.out.println(sumaPotRec(4,3));
        mostrarTabla(5);
        //mostrarTablaRec(1,5);
        mostrarFactores(5);
        //mostrarFactoresRec(5);
        System.out.println(sumaInter(6));
        System.out.println(sumaInterRec(6));
        System.out.println(sumaGeom(3));
        System.out.println(sumaGeomRec(6));
        System.out.println(sumaEscalada(5));
        System.out.println(sumaEscaladaRec(5,1));
        System.out.println(sumaPicuartos(16384));
        System.out.println(sumaProducto(5));
        System.out.println(sumaExpon(5, 1));
        System.out.println(sumaSeno(2, 4));
        System.out.println(sumaCoseno(2, 3));
        System.out.println(escalada(5,2,0));
    }
}
