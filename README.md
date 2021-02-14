# HttpBin IaC

Ce projet propose la mise en place d'une infrastructure pour le projet [httpbin](https://github.com/postmanlabs/httpbin)

## Set up de l'environnement
### Configuration des credentials
S'il n'existe pas, créez le fichier suivant :
```
 ~/.aws/credentials 
```

Rajouter la configuration 
```
[wttj]
aws_access_key_id = <KEY_ID>
aws_secret_access_key = <KEY_SECRET>
```


### Installation de terraform et terragrunt: 

terraform: `0.14.6`
terragrunt `0.28.3`

Vous pouvez utiliser [tfenv](https://github.com/tfutils/tfenv) pour terraform et [tgenv](https://github.com/cunymatthieu/tgenv) pour terragrunt

```
tfenv install 0.14.6
tfenv use 0.14.6
```

```
tgenv install 0.28.3
tgenv use 0.28.3
```

### Installation de packer
Suivre la documentation : [https://www.packer.io/downloads](https://www.packer.io/downloads)

### Installation d'ansible
```
virtualenv --python python3 venv
source venv/bin/activate
pip3 install -r requirements.txt
```
------------
## Lancement de l'application

Exporter les variables d'environnement suivantes :
```
export AWS_PROFILE=wttj
export AWS_DEFAULT_REGION=eu-west-3
```

Puis: 
```
make all
```
----
## Destruction de l'infrastructure
```
make destroy
```
----
## Outil de conformité et documentation

### Checkov
Suivre la documentation [github](https://github.com/bridgecrewio/checkov#installation) pour l'installation.
Pour scanner le code et vérifier les bonnes pratiques autour des services aws, checkov est utilisé.
L'ensemble des règles peut être retrouver [ici](https://github.com/bridgecrewio/checkov/blob/master/docs/3.Scans/resource-scans.md) 

```
make checkov
```

### Terraform-docs
Suivre la documentation [github](https://github.com/terraform-docs/terraform-docs#installation) pour l'installation.
Pour générer la documentation associée à chaque module de façon automatisée, terraform-docs est utilisé.

```
make docs
```