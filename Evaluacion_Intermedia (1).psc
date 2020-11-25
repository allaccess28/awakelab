Proceso datos 
	definir user,mostrar, contarusuarios, usuarios,f,c, MENU, filas3, cols3, k, l Como Entero;
	definir matriz Como Caracter;
	Dimension matriz[100,10];	
	usuarios<-0;
	Escribir "              *******************************************";
	Escribir "              *      Asesorías en Prevencion            *";
	Escribir "              *               de Riesgos                *";
	Escribir "              *               Bienvenido                *";
	Escribir "              *                                         *";
	Escribir "              *******************************************";	
	
	Para k<-0 hasta 99 Con Paso 1 Hacer		//relleno de matriz para evitar error al seleccionar otras opciones sin haber ingresado datos
		para l<-0 hasta 9 Con Paso 1 Hacer
			matriz[k,l]<-" ";
		FinPara		
	FinPara
	Repetir
		Escribir "";
		Escribir "";
		Escribir "--------------------------------------";
		Escribir "-------------------------------------|";
		Escribir "                                     |";
		Escribir "---Elija la opcion a Ejecutar.       |";	//hasta que la opcion uno no ingrese datos siempre volvera al menu.
		Escribir "                                     |";
		Escribir "--REGISTRAR USUARIOS (1)             |";
		Escribir "--MOSTRAR USUARIOS (2)               |";
		Escribir "--CONTAR USUARIOS POR CATEGORIA (3)  |";
		Escribir "--MODIFICAR USUARIOS (4)             |";
		Escribir "--ELIMINAR USUARIOS (5)              |";
		Escribir "--SALIR (6)                          |";
		Escribir "-------------------------------------|";
		Escribir "--------------------------------------";
		Leer MENU;
		
		Si MENU>0 Y MENU<7 Entonces			
			Segun MENU Hacer					//llamada a subprocesos
				1:
					Escribir "Ingrese cantidad de usuarios (max 100)";
					Leer usuarios;
					datos_usuarios(matriz, usuarios);					
				2:
					mostrarusuarios(matriz, usuarios);					
				3:
					contarUsuariosPorCategoria(matriz,usuarios);					
				4:	
					modif_Usuario(matriz,usuarios);					
				5:
					eliminarUsuario(matriz, usuarios);					
				De Otro Modo:					
			FinSegun
		SiNo
			Escribir "Ingreso no Valido, intente nuevamente.";
		FinSi		
	Hasta Que MENU=6	
	Escribir "Muchas Gracias";	
FinProceso

SubProceso datos_usuarios(matriz, usuarios)			//ingreso de datos para usuarios	
	Definir cliente, profesional, administrativo, nombre, direccion, fecha, departamento, func, superior, rut  Como Caracter;
	Definir num, cont, empleados, telefono, experiencia, f, c,n, filas, cols Como Entero;		
		
	Para f<-0 Hasta usuarios-1 Con Paso 1 Hacer	
		Escribir "Ingrese su Nombre Completo:";
		Leer matriz[f,1];
		Repetir
			Si matriz[f,1]="" Entonces			//validacion nombre
				Escribir "Entrada Invalida";
				Escribir "Ingrese su Nombre Completo";
				Leer matriz[f,1];
			FinSi						
		Hasta Que matriz[f,1]<>"";				
		
		Escribir "Ingrese su Fecha de Nacimiento:";
		Leer matriz[f,2];
		Repetir
			Si matriz[f,2]="" Entonces			//validacion fechanac
				Escribir "Ingrese el Rut";
				Leer matriz[f,2];
			FinSi						
		Hasta Que matriz[f,2]<>"";				
		
		Escribir "Ingrese el Rut";
		leer matriz[f,3];
		Repetir
			Si matriz[f,3]="" Entonces			//validacion rut
				Escribir "Entrada Invalida";
				Escribir "Ingrese el Rut";
				Leer matriz[f,3];
			FinSi
		Hasta Que matriz[f,3]<>"";				
		
		Repetir						//menu en repetir hasta ingreso valido del tipo de usuario
			Escribir "Favor Ingrese Rol";
			Escribir " ";
			Escribir "Para CLIENTE ( 1 )";
			Escribir "Para PROFESIONAL ( 2 )";
			Escribir "Para ADMINISTRATIVO ( 3 )";
			Escribir ">>>Ingresar Opción:";
			Leer num;
		Hasta Que num >= 1 y num <= 3
		
		Segun num Hacer
			1:	matriz[f,0]<-"CLIENTE";				//ingreso datos cliente			
					
				Repetir
					Escribir "Ingrese su Dirección:";
					leer matriz[f,4];
				Hasta Que matriz[f,4]<>"";
				
				Repetir
					Escribir "Ingrese su Teléfono";
					leer matriz[f,5];
				Hasta Que matriz[f,5]<>"";
				
				Repetir
					Escribir "Cantidad de Empleados:";
					leer Matriz[F,6];
				Hasta Que matriz[f,6]<>"";				
				
			2:	matriz[f,0]<-"PROFESIONAL";			//ingreso datos profesional				
				
				Repetir
					Escribir "Ingrese los Años de Experiencia en el Cargo:";
					Leer matriz[f,4];
				Hasta Que matriz[f,4]<>"";
				
				Repetir
					Escribir "Ingrese su Departamento";
					Leer matriz[f,5];
				Hasta Que matriz[f,5]<>"";
				
			3:  matriz[f,0]<-"ADMINISTRATIVO";		//ingreso datos de administrativo
				
				Repetir
					Escribir "Ingrese su Funcion:";
					Leer matriz[f,4];
				Hasta Que matriz[f,4]<>"";
				
				Repetir
					Escribir "Ingrese nombre de su Superior:";
					Leer matriz[f,5];					
				Hasta Que matriz[f,5]<>"";		
		FinSegun
		Escribir "";
		Escribir "--------------------------------------------------------";
		Escribir "";		
	FinPara
FinSubProceso  //fin ingresos datos

SubProceso mostrarusuarios(matriz, usuarios)			//impresion de datos
	definir n,mostrar,filas,cols,f,c, semaforo Como Entero;
	semaforo<-0;
	para f<-0 hasta usuarios -1 Hacer		// discriminacion para presentar clientes primero
		
		Si matriz[f,0] <> " " Entonces			
			Para c<-0 Hasta 9 Con Paso 1 Hacer
				semaforo<-1;		//bandera para evitar error en caso de no haber usuarios ingresados
				escribir Sin Saltar matriz[f,c];
				escribir Sin Saltar " ";
			FinPara
				Escribir "";
		FinSi
			
	FinPara
	si semaforo=0 Entonces
		Escribir ">>>>>> No hay Usuarios <<<<<<<";
	FinSi	
FinSubProceso										//fin mostrar usuarios

SubProceso contarUsuariosPorCategoria(matriz, usuarios)			//contar usuarios de cada categoria
	definir f,c,sumc, sump, suma como entero;
	sumc<-0;
	suma<-0;
	sump<-0;
	para f<-0 hasta usuarios-1 Hacer
		para c<-0 hasta 5 hacer
			si matriz[f,c] = "CLIENTE" Entonces
				sumc<-sumc+1;
			FinSi
			si matriz[f,c] = "ADMINISTRATIVO" Entonces
				suma<-suma+1;
			FinSi
			si matriz[f,c] = "PROFESIONAL" Entonces
				sump<-sump+1;
			FinSi
		FinPara		
	FinPara
	Escribir "La cantidad de Clientes es = ", sumc;
	Escribir "La cantidad de Profesionales es = ", sump;
	Escribir "La cantidad de Administrativos es = ", suma;
	
FinSubProceso											//fin proceso mostrar usuarios

SubProceso modif_Usuario(matriz, usuarios)			//funcion modificar usuario	
	Definir f, c , filas, cols, modif, num, semaforo Como Entero;			//definimos las variables
	Definir rutquery Como Caracter;
	filas<-100;
	cols<-10;	
	Escribir "Ingrese el Rut a consultar:";
	Leer rutquery;
	semaforo<-0;
	Para f<-0 Hasta usuarios-1 Con Paso 1 Hacer		//creamos una secuencia que repase la matriz en busqueda del numero
		Si matriz[f,3]=rutquery Entonces
			semaforo<-1;  //bandera para evitar mensaje de error si es que encuentra rut en iteraciones posteriores
			Escribir "El Rut ", rutquery, " corresponde a ", matriz[f,1], " cuya fecha de nac/creacion es ", matriz[f,2];
			Escribir "Para Modificar Usuario presione ( 1 ), para volver al menu principal ( 2 )";
			leer modif;
			Escribir "Ingrese su Nombre Completo:";
			Leer matriz[f,1];
			Repetir
				Si matriz[f,1]="" Entonces			//vlidacion nombre
					Escribir "Entrada Invalida";
					Escribir "Ingrese su Nombre Completo";
					Leer matriz[f,1];
				FinSi								
			Hasta Que matriz[f,1]<>"";					
			
			Escribir "Ingrese su Fecha de Nacimiento:";
			Leer matriz[f,2];
			Repetir
				Si matriz[f,2]="" Entonces			//vlidacion fechanac
					Escribir "Ingrese el Rut";
					Leer matriz[f,2];
				FinSi								
			Hasta Que matriz[f,2]<>"";	
			Escribir "Ingrese el Rut";
			leer matriz[f,3];
			Repetir
				Si matriz[f,3]="" Entonces			//vlidacion rut
					Escribir "Entrada Invalida";
					Escribir "Ingrese el Rut";
					Leer matriz[f,3];
				FinSi
			Hasta Que matriz[f,3]<>"";						
			Segun modif Hacer
				1:
					
					Repetir
						Escribir "Favor Ingrese Rol";
						Escribir " ";
						Escribir "Para CLIENTE ( 1 )";
						Escribir "Para PROFESIONAL ( 2 )";
						Escribir "Para ADMINISTRATIVO ( 3 )";
						Escribir ">>>Ingresar Opción:";
						Leer num;
					Hasta Que num >= 1 y num <= 3
					
					Segun num Hacer
						1:	matriz[f,0]<-"CLIENTE";				//ingreso datos cliente
							Repetir
								Escribir "Ingrese su Dirección:";
								leer matriz[f,4];
							Hasta Que matriz[f,4]<>"";
							
							Repetir
								Escribir "Ingrese su Teléfono";
								leer matriz[f,5];
							Hasta Que matriz[f,5]<>"";
							
							Repetir
								Escribir "Cantidad de Empleados:";
								leer Matriz[F,6];
							Hasta Que matriz[f,6]<>"";
							
						2:	matriz[f,0]<-"PROFESIONAL";			//ingreso datos profesional							
							Repetir
								Escribir "Ingrese los Años de Experiencia en el Cargo:";
								leer matriz[f,4];
							Hasta Que matriz[f,4]<>"";
							
							Repetir
								Escribir "Ingrese su Departamento";
								leer matriz[f,5];
							Hasta Que matriz[f,5]<>"";
							
						3:  matriz[f,0]<-"ADMINISTRATIVO";		//ingreso datos de administrativo
							Repetir
								Escribir "Ingrese su Funcion:";
								leer matriz[f,4];
							Hasta Que matriz[f,4]<>"";
							
							Repetir
								Escribir "Ingrese nombre de su Superior:";
								leer matriz[f,5];								
							Hasta Que matriz[f,5]<>"";					
							
					FinSegun
					Escribir "";
					Escribir "--------------------------------------------------------";
					Escribir "";
				2:
					Escribir "";	
				
			FinSegun
		SiNo
			
		FinSi
	FinPara
	
	Si semaforo=0 Entonces				//Aviso en caso que no encuentre rut
		Escribir ">>>>>> Rut no registrado <<<<<<";
	FinSi
	
FinSubProceso												//fin proceso editar

SubProceso eliminarUsuario(matriz, usuarios)			//eliminar Usuario
	Definir f, c , filas, cols, modif, num, i, semaforo Como Entero;			//definimos las variables
	Definir rutquery Como Caracter;
	filas<-100;
	cols<-10;
	Dimension Matriz2[1,10];
	Escribir "Ingrese el Rut a consultar:";
	Leer rutquery;
	semaforo<-0;
	Para f<-0 Hasta usuarios-1 Con Paso 1 Hacer		//creamos una secuencia que repase la matriz en busqueda del numero
		Si matriz[f,3]=rutquery Entonces
			semaforo<-1;
			Escribir "El Rut ", rutquery, " corresponde a ", matriz[f,1], " cuya fecha de nac/creacion es ", matriz[f,2];
			Escribir "Para Eliminar Usuario presione ( 1 ), para volver al menu principal ( 2 )";
			Leer num;
			Segun num Hacer
				1:	Para i<-0 Hasta cols-1 Con Paso 1 Hacer		//sobrescribimos espacios vacios sobre datos antiguos
						matriz[f,i]<-" ";						
					FinPara
					Escribir ">>>>>>> Usuario Eliminado <<<<<<<";					
				2:	Escribir "";
			FinSegun			
		FinSi		
	FinPara
	Si semaforo=0 Entonces						//mensaje en caso de no existir rut
		Escribir ">>>>>>> Rut no Encontrado <<<<<<<";
	FinSi	
FinSubProceso