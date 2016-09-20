package test;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import administracion.prestacion.Prestacion;
import appModel.ModeloAdminPrestaciones;

public class TestModeloAdminPrestaciones
{

	ModeloAdminPrestaciones mAP = new ModeloAdminPrestaciones();
	
	Prestacion servicio = new Prestacion();
	Prestacion lugar = new Prestacion();
	
	@Before
	public void init()
	{		
		mAP.agregarServicio(servicio);
	}
	
	@Test
	public void elemento_En_Servicios_Y_Lugares()
	{
		assertEquals(1, mAP.getServicios().size());
		
		mAP.agregarLugar(lugar);
		assertEquals(1, mAP.getLugares().size());
	}

}
