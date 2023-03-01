# Formatando os resultados em uma lista

#Inicializa uma lista vazia 
from_db = []

# Percorrer os resultados e inseri-los à lista

# Retorna uma lista de tuplas
for result in results:
  result = result
  from_db.append(result)


#Formatando o resultado em uma lista de listas

# Retorna uma lista de listas
from_db = []

for result in results:
  result = list(result)
  from_db.append(result)


#Formatando o resultado em um DataFrame do Pandas

# Retorna uma lista de listas e cria um DataFrame do Pandas
from_db = []

for result in results:
  result = list(result)
  from_db.append(result)


columns = ["course_id", "course_name", "language", "client_name", "address"]
df = pd.DataFrame(from_db, columns=columns)


