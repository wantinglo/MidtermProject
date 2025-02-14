package tw.wantinglo.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class SessionFactoryListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		HibernateUtil.getSessionFactory();
		System.out.println("SessionFactory Created.");
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		HibernateUtil.closeSessionFactory();
		System.out.println("SessionFactory Destroyed."); 
	}

}
