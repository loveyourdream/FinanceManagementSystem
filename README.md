# FinanceManagementSystem
LTI Project :


configuration
com.lti.finkart
Finkart_Finance
war


//pom.xml

<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<groupId>com.lti.training</groupId>
	<artifactId>spring-restbased-mvc</artifactId>
	<version>1.0</version>
	<packaging>war</packaging>

	<properties>
		<spring.version>5.1.8.RELEASE</spring.version>
		<oracle.version>11.2.0.3</oracle.version>
		<apache.version>2.6.0</apache.version>
		<hibernate.version>5.4.3.Final</hibernate.version>
	</properties>

	<dependencies>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-core</artifactId>
			<version>${spring.version}</version>
		</dependency>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-orm</artifactId>
			<version>${spring.version}</version>
		</dependency>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-web</artifactId>
			<version>${spring.version}</version>
		</dependency>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-webmvc</artifactId>
			<version>${spring.version}</version>
		</dependency>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-context</artifactId>
			<version>${spring.version}</version>
		</dependency>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-jdbc</artifactId>
			<version>${spring.version}</version>
		</dependency>
		
		<dependency>
			<groupId>com.oracle</groupId>
			<artifactId>ojdbc6</artifactId>
			<version>${oracle.version}</version>
		</dependency>
		
		<dependency>
			<groupId>org.apache.commons</groupId>
			<artifactId>commons-dbcp2</artifactId>
			<version>${apache.version}</version>
		</dependency>
		
		<dependency>
			<groupId>org.hibernate</groupId>
			<artifactId>hibernate-core</artifactId>
			<version>${hibernate.version}</version>
		</dependency>
		
		<dependency>
			<groupId>javax.servlet</groupId>
			<artifactId>jstl</artifactId>
			<version>1.2</version>
		</dependency>

		<!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-databind -->
		<dependency>
			<groupId>com.fasterxml.jackson.core</groupId>
			<artifactId>jackson-databind</artifactId>
			<version>2.9.9.2</version>
		</dependency>

	</dependencies>
	<repositories>
		<repository>
			<id>codelds</id>
			<url>https://code.lds.org/nexus/content/groups/main-repo</url>
		</repository>
	</repositories>
</project>


// spring-config.xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:context="http://www.springframework.org/schema/context"
    xmlns:tx="http://www.springframework.org/schema/tx"
    xmlns:mvc="http://www.springframework.org/schema/mvc"
    xsi:schemaLocation="http://www.springframework.org/schema/beans
        https://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/context
        https://www.springframework.org/schema/context/spring-context.xsd
        http://www.springframework.org/schema/tx
        https://www.springframework.org/schema/tx/spring-tx.xsd
		http://www.springframework.org/schema/mvc
        https://www.springframework.org/schema/mvc/spring-mvc.xsd">

	<!-- Enabling support for JSON parsing, validation and other
	features of Spring MVC -->
	<mvc:annotation-driven />
	
		<!-- Loading Annoted beans -->
    	<context:component-scan base-package="com.lti.controller"/>
    	<context:component-scan base-package="com.lti.dao"/>
    	<context:component-scan base-package="com.lti.service"/>
    	
    <!-- more bean definitions go here -->
	 <bean id="dataSource" class="org.apache.commons.dbcp2.BasicDataSource" destroy-method="close">
        <property name="driverClassName" value="oracle.jdbc.driver.OracleDriver"/>
        <property name="url" value="jdbc:oracle:thin:@localhost:1521:XE"/>
        <property name="username" value="hr"/>
        <property name="password" value="hr"/>
    </bean>
	
	<!-- EntityManagerFactory Configuration
	Required when using ORM in our Project.
	This bean entry will automatically create EntityManagerFactory & EntityManage Object for us.
	Also no need of separate META-INF/persistence.xml file since all settings can be done here itself
	within this bean tag. -->
	<bean id="myEmf"
  class="org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean">
	    <property name="dataSource" ref="dataSource" />
	    <property name="packagesToScan" value="com.lti.entity" />
	    <property name="jpaVendorAdapter">
	        <bean class="org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter" />
	    </property>
	    <property name="jpaProperties">
	        <props>
	            <prop key="hibernate.hbm2ddl.auto">update</prop>
	            <prop key="hibernate.show_sql">true</prop>
	        </props>
	    </property>
	</bean>
	
	<!-- This bean will manage the transaction for us, 
	s no need to manually write the code to begin/commit/rollback 
	we just need to use @Transactional annotation-->
	<bean id="transactionManager" class="org.springframework.orm.jpa.JpaTransactionManager">
    	<property name="entityManagerFactory" ref="myEmf" />
	</bean>
	<tx:annotation-driven/>
	
</beans>


// web.xml

<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns="http://java.sun.com/xml/ns/javaee"
	xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd"
	version="2.5">
	<display-name>spring-mvc</display-name>
	<welcome-file-list>
		<welcome-file>index.html</welcome-file>
		<welcome-file>index.htm</welcome-file>
		<welcome-file>index.jsp</welcome-file>
		<welcome-file>default.html</welcome-file>
		<welcome-file>default.htm</welcome-file>
		<welcome-file>default.jsp</welcome-file>
	</welcome-file-list>
	
	
	<servlet>
		<servlet-name>app</servlet-name>
		<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
		<init-param>
			<param-name>contextConfigLocation</param-name>
			<param-value>/WEB-INF/spring-config.xml</param-value>
		</init-param>
		<load-on-startup>1</load-on-startup>
	</servlet>

	<servlet-mapping>
		<servlet-name>app</servlet-name>
		<url-pattern>*.lti</url-pattern>
	</servlet-mapping>
</web-app>

