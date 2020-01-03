import java.io.*;
class Cambio{

	public static void main (String []args){

	String sDirectorio = "imagenes";
	File f	= new File (sDirectorio);
	BufferedWriter bw;
	if(f.exists()){
	File[] ficheros = f.listFiles();
	try{
	bw = new BufferedWriter(new FileWriter("texto\\escenarios.txt"));
	for(int x=0; x<ficheros.length; x++){
		String s = ficheros[x].getName()+"##";
		int resultado = s.indexOf("escenario");
		
		if(resultado != -1)
			bw.write(s);
		/*String s = "escenario"+(x+1)+".gif";
		System.out.print(x+": " + ficheros[x].getName()+"\t->\t");
		ficheros[x].renameTo(new File(s));
		System.out.println(ficheros[x].getName());	*/
	}
	bw.close();
	}catch(IOException e){
	System.out.println(e);	
	}
	
	}else{
		System.out.println("No hay nada");
	}

	}
}
