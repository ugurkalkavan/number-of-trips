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

