# NuxDiet — Site Institucional

Site estático de apresentação do aplicativo NuxDiet, hospedado na AWS com infraestrutura provisionada via Terraform e deploy automatizado pelo GitHub Actions.

## Stack

| Camada | Tecnologia |
|--------|-----------|
| Hospedagem | AWS S3 (static website) |
| CDN / HTTPS | AWS CloudFront |
| IaC | Terraform |
| CI/CD | GitHub Actions |

## Estrutura

```
nuxdiet/
├── .github/
│   └── workflows/
│       └── ci.yml          # Pipeline CI/CD
├── terraform/
│   ├── providers.tf        # Configuração do provider AWS
│   ├── variables.tf        # Variáveis do projeto
│   ├── main.tf             # S3 + CloudFront
│   └── outputs.tf          # URLs de saída
├── src/
│   ├── index.html          # Página principal
│   └── style.css           # Estilos
└── README.md
```

## Como provisionar a infra (primeira vez)

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

Após o `apply`, copie o valor de `cloudfront_domain` — essa é a URL pública do site.

## Secrets necessários no GitHub

| Secret | Descrição |
|--------|-----------|
| `AWS_ACCESS_KEY_ID` | Chave de acesso do usuário IAM |
| `AWS_SECRET_ACCESS_KEY` | Chave secreta do usuário IAM |

## Pipeline CI

- **Em todo push/PR para `main`**: valida HTML, roda `terraform fmt` e `terraform validate`
- **Apenas em push para `main`**: faz deploy dos arquivos no S3 e invalida cache do CloudFront

## Trabalho acadêmico

Projeto desenvolvido como parte da disciplina **DevOps na Prática — PUCRS**, Fase 1.
