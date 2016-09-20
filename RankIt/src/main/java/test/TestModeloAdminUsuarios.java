package test;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;

import administracion.usuario.Usuario;
import appModel.ModeloAdminUsuarios;

public class TestModeloAdminUsuarios
{
	Usuario usuario = new Usuario("Dummy", "a");
	ModeloAdminUsuarios mAU = new ModeloAdminUsuarios();

	@Before
	public void init()
	{		
		mAU.setUsuarios(new ArrayList<Usuario>());
	}
	
	@Test
	public void test()
	{

		mAU.agregarUsuario(usuario);
		assertEquals(1, mAU.getUsuarios().size());
	}

}
