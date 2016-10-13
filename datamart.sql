drop database if exists datamart_trafico;
create database datamart_trafico default character set utf8 default collate utf8_spanish_ci;
	use datamart_trafico;

	create table dim_tiempo ( 
		id_tiempo int auto_increment primary key, 
		minuto int(2),
		hora int(2),
		dia int(2),
		mes int(2),
		anho int(4),
		dia_semana int(1),
		festivo boolean
	);
		
	create table dim_clima (
		id_clima int auto_increment primary key,
        condicion_meteorologica varchar(60)
	);

	create table dim_vehiculo(
		id_vehiculo int auto_increment primary key,
		tipo_vehiculo varchar(60),
        articulado varchar(60),
        año int(4),
		maniobra varchar(60),
		impacto varchar(60),
		volante_izq boolean,
		combustible varchar(60)
	);

	create table dim_via(
		id_via int auto_increment primary key,
        tipo_via varchar(60),
		n_carriles int(2),
		velocidad_autorizada int(3),
		estado_via varchar(60),
		peligros_calzada varchar(60),
		urbano varchar(60)
	);
	
	create table dim_conductor(
		id_conductor int auto_increment primary key,
		sexo varchar(60),
		edad int(3),
		ebrio boolean,
		rango_edad varchar(60)
	);
	
	create table dim_localizacion(
		id_localizacion int auto_increment primary key,
		localidad varchar(60)	
	);
	
	create table dim_damnificado(
		id_damnificado int auto_increment primary key,
		tipo_damnificado varchar(60),
		sexo varchar(60),
		edad int(3),
		rango_edad int(2),
		gravedad varchar(60),
		pasajero varchar(60)
	);
	
	create table fact_accidente (
		id_tiempo int, 
		id_clima int , 
		id_vehiculo int , 
		id_via int,
		id_conductor int,
		id_localizacion int,
		id_damnificado int,
        vehiculos_implicados int,
		n_damnificados int,
        key dim_tiempo (id_tiempo),
		key dim_clima(id_clima),
		key dim_vehiculo (id_vehiculo),
		key dim_via (id_via),
		key dim_conductor (id_conductor),
		key dim_localizacion (id_localizacion),
		key dim_damnificado (id_damnificado)
	); 











		