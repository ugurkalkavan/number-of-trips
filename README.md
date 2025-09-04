# Python CSV → PostgreSQL Case

Bu proje, bir CSV dosyasını okuyup PostgreSQL tablosuna yazan ve SQL sorgularını çalıştırarak sonuçları terminalde tablo formatında gösteren bir Python uygulamasıdır. Kubernetes üzerinde showcase yapmak için yapılandırılmıştır.

---

## 🛠️ Gereksinimler

- Python 3.12+
- PostgreSQL (Kubernetes Pod/Service)
- Docker
- Minikube veya başka Kubernetes cluster
- pip packages: `sqlalchemy`, `psycopg2-binary`, `pandas`, `tabulate`, `python-dotenv`

---

## ⚡ Kullanım

### 1. Local Kubernetes Cluster başlat
```bash
minikube start
```

Docker image build ve Kubernetes deploy

```bash
./build-run-k8s.sh
```

ÖNEMLİ NOT!

Query 2'nin sonuç döndürmesi için csv datasına ek olarak 3 kayıt ekledim.

t_1;c_1;d_1;2022-01-14 18:25:04.000;done

t_1;c_1;d_1;2022-01-13 18:25:04.000;done

t_1;c_1;d_2;2022-01-13 18:25:04.000;done



```markdown
📊 Query1 Sonucu
+-------------+--------------+----------------+
| driver_id   |   total_days |   success_rate |
|-------------+--------------+----------------|
| d_1         |            7 |             50 |
| d_10        |            5 |             50 |
| d_11        |            5 |             50 |
| d_12        |            5 |             50 |
| d_13        |            5 |             50 |
| d_14        |            5 |             50 |
| d_15        |            5 |             50 |
| d_16        |            5 |             50 |
| d_17        |            5 |             50 |
| d_18        |            5 |             50 |
| d_19        |            5 |             50 |
| d_2         |            6 |             50 |
| d_20        |            5 |             50 |
| d_3         |            5 |             50 |
| d_4         |            5 |             50 |
| d_5         |            5 |             50 |
| d_6         |            5 |             50 |
| d_7         |            5 |             50 |
| d_8         |            5 |             50 |
| d_9         |            5 |             50 |
+-------------+--------------+----------------+
```


```markdown
📊 Query2 Sonucu
+-------------+------+-------------+
| view_type   | id   |   total_cnt |
|-------------+------+-------------|
| CLIENT      | c_1  |           3 |
| DRIVER      | d_1  |           2 |
| DRIVER      | d_2  |           1 |
+-------------+------+-------------+
```