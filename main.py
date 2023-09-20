import pyodbc
import pandas as pd

# Definindo as informações de conexão com o SQL Server
server_name = "localhost"
database_name = "your_database_name"
user_name = "your_username"
password = "your_password"

# Função para criar uma conexão com o SQL Server
def create_server_connection(server_name, user_name, password):
    try:
        connection = pyodbc.connect(
            f"DRIVER=ODBC Driver 17 for SQL Server;SERVER={server_name};UID={user_name};PWD={password};"
        )
        print("SQL Server Database connection successful")
        return connection
    except pyodbc.Error as err:
        print(f"Error: '{err}'")
        return None

# Função para criar um banco de dados no SQL Server
def create_database(connection, query):
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        print("Database created successfully")
    except pyodbc.Error as err:
        print(f"Error: '{err}'")

# Criando uma conexão com o SQL Server
connection = create_server_connection(server_name, user_name, password)

# Define o nome do banco de dados que você deseja criar
db_name = "your_new_database_name"

# Query para criar um novo banco de dados
create_db_query = f"CREATE DATABASE {db_name};"

# Cria o banco de dados
create_database(connection, create_db_query)

# Função para executar consultas SQL
def execute_query(connection, query):
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        connection.commit()
        print("Query successful")
    except pyodbc.Error as err:
        print(f"Error: '{err}'")

# Consulta SQL para criar a tabela de professores (teacher)
create_teacher_table = """
CREATE TABLE teacher (
  teacher_id INT PRIMARY KEY,
  first_name NVARCHAR(40) NOT NULL,
  last_name NVARCHAR(40) NOT NULL,
  language_1 NVARCHAR(3) NOT NULL,
  language_2 NVARCHAR(3),
  dob DATE,
  tax_id INT UNIQUE,
  phone_no NVARCHAR(20)
);
"""

# Execute a consulta para criar a tabela de professores
execute_query(connection, create_teacher_table)

# Consulta SQL para criar a tabela de clientes (client)
create_client_table = """
CREATE TABLE client (
  client_id INT PRIMARY KEY,
  client_name NVARCHAR(40) NOT NULL,
  address NVARCHAR(60) NOT NULL,
  industry NVARCHAR(20)
);
"""

# Execute a consulta para criar a tabela de clientes
execute_query(connection, create_client_table)

# Consulta SQL para criar a tabela de participantes (participant)
create_participant_table = """
CREATE TABLE participant (
  participant_id INT PRIMARY KEY,
  first_name NVARCHAR(40) NOT NULL,
  last_name NVARCHAR(40) NOT NULL,
  phone_no NVARCHAR(20),
  client INT
);
"""

# Execute a consulta para criar a tabela de participantes
execute_query(connection, create_participant_table)

# Consulta SQL para criar a tabela de cursos (course)
create_course_table = """
CREATE TABLE course (
  course_id INT PRIMARY KEY,
  course_name NVARCHAR(40) NOT NULL,
  language NVARCHAR(3) NOT NULL,
  level NVARCHAR(2),
  course_length_weeks INT,
  start_date DATE,
  in_school BIT,
  teacher INT,
  client INT
);
"""

# Execute a consulta para criar a tabela de cursos
execute_query(connection, create_course_table)

# Consulta SQL para criar a tabela de relacionamento entre participantes e cursos (takes_course)
create_takescourse_table = """
CREATE TABLE takes_course (
  participant_id INT,
  course_id INT,
  PRIMARY KEY(participant_id, course_id),
  FOREIGN KEY(participant_id) REFERENCES participant(participant_id) ON DELETE CASCADE,
  FOREIGN KEY(course_id) REFERENCES course(course_id) ON DELETE CASCADE
);
"""

# Execute a consulta para criar a tabela de relacionamento entre participantes e cursos
execute_query(connection, create_takescourse_table)

# Consulta SQL para inserir dados na tabela de professores (teacher)
pop_teacher = """
INSERT INTO teacher VALUES
(1, 'James', 'Smith', 'ENG', NULL, '1985-04-20', 12345, '+491774553676'),
(2, 'Stefanie', 'Martin', 'FRA', NULL, '1970-02-17', 23456, '+491234567890'),
(3, 'Steve', 'Wang', 'MAN', 'ENG', '1990-11-12', 34567, '+447840921333'),
(4, 'Friederike', 'Müller-Rossi', 'DEU', 'ITA', '1987-07-07', 45678, '+
