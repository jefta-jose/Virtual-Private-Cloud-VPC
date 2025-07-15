
---

### ✅ Use a PostregSQL container if you don't want to set up Postgres locall:

1. **Run PostgreSQL in a Docker container**, exposing the port.
2. **Mount a volume** to persist data.
3. **Use the connection string** in your app to interact with the DB, just like you would with a local Postgres.

---

### 🐳 Step-by-Step: Run PostgreSQL in Docker

#### **Option A: Docker CLI**

```bash
docker run --name my-postgres \
  -e POSTGRES_USER=adminuser \
  -e POSTGRES_PASSWORD=@dm1n/2025 \
  -e POSTGRES_DB=MyDB \
  -p 5432:5432 \
  -v pgdata:/var/lib/postgresql/data \
  -d postgres:15
```

* `5432:5432`: Exposes the default Postgres port.
* `pgdata:/var/lib/postgresql/data`: Persists data in a Docker volume.
* You can change the version (`postgres:15`) as needed.

---

### 🔗 Connection String

You’ll use this in your app (Python, Node.js, etc.):

```
postgresql://myuser:mypassword@localhost:5432/mydb
```

* You can also format it like this:

  ```python
  DB_URI = "dbname='mydb' user='myuser' password='mypassword' host='localhost' port='5432'"
  ```

---

### 🧪 Testing It

Try connecting with `psql` from another container or with a tool like DBeaver, pgAdmin, or Postico. Example:

```bash
docker exec -it my-postgres psql -U myuser -d mydb
```

---

### 🛠 Use Case Example (Python + psycopg2)

```python
import psycopg2

conn = psycopg2.connect(
    dbname="mydb",
    user="myuser",
    password="mypassword",
    host="localhost",
    port="5432"
)

cur = conn.cursor()
cur.execute("CREATE TABLE IF NOT EXISTS movies (id SERIAL PRIMARY KEY, title TEXT);")
cur.execute("INSERT INTO movies (title) VALUES (%s);", ("Inception",))
conn.commit()

cur.execute("SELECT * FROM movies;")
print(cur.fetchall())
cur.close()
conn.close()
```

---

### 🧼 To Clean Up

```bash
docker stop my-postgres
docker rm my-postgres
docker volume rm pgdata  # optional: deletes all saved data
```

---