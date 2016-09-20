package test;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import administracion.calificacion.Calificacion;
import administracion.usuario.Usuario;
import appModel.ModeloAdminCalificaciones;

public class TestModeloAdminCalificaciones
{	
	//Calificacion Buena para pizzeria
	Calificacion calificacionBuenaPizzeria;
	
	//Calificacion Mala para pizzeria
	Calificacion calificacionMalaPizzeria;
	
	//Lista de calificaciones
	List<Calificacion> calificaciones = new ArrayList<Calificacion>();
	
	//Administrador de Calificaciones
	ModeloAdminCalificaciones mAdCal = new ModeloAdminCalificaciones();
	
	@Before
	public void init()
	{
		calificaciones.add(calificacionBuenaPizzeria);
		calificaciones.add(calificacionMalaPizzeria);
	}
		
	

	@Test
	public void cantidad_De_Calificaciones()
	{
		assertEquals(2,calificaciones.size());
	}
	
	@Test
	public void prueba()
	{

		mAdCal.setCalificaciones(calificaciones);
		mAdCal.setEvaluado(""); //El que es evaluado
		mAdCal.setUsuario(""); //El que evalua
		mAdCal.setCalificacionSeleccionada(new Calificacion());
		mAdCal.setNuevaCalificacion(new Calificacion());
		mAdCal.setAdmin(new Usuario("ADMIN","123"));
		mAdCal.agregar();									//Falla a en la parte de "buscar()" de ModeloAdminCalificaciones
		assertEquals(1,mAdCal.getCalificaciones().size());
	}

}
