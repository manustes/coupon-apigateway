# Api Gateway Coupon

[![Terraform](https://img.shields.io/badge/terraform-purple.svg)](https://www.terraform.io/)

Para ejecutar la siguiente ApiGateway debes tener instalado.

- [Git](http://git-scm.com/)
- [Terraform](https://www.terraform.io/)
- [AWS](https://aws.amazon.com/)
- [AWS-cli](https://aws.amazon.com/es/cli/)

## Instalación

- `git clone https://github.com/manustes/coupon-apigateway.git`

## Dependencias

- Cuenta de AWS y credenciales
- Configuración aws_access_key_id, aws_secret_access_key, aws_session_token

Ejecutar `aws configure` o modificar directamente archivo `.aws\credentials`.

## Construcción

Ejecutar `terraform init`.

## plan de ejecución

Ejecutar `terraform plan`.

## deploy

Ejecutar `terraform apply`.

## Finalización de las pruebas.

Ejecutar `terraform destroy`.

## Recursos Creados

- ApiGateway - (`Ingresar a aws, servicio aws apigateway, seleccionar el recurso API coupon, etapas, api, y se encontrara la url de acceso.`)
- Lambdas - (`lambda-coupon`)

- ApiGateway

![ApiGateway](https://raw.githubusercontent.com/manustes/coupon-apigateway/master/assets/apigateway.png)

- Etapa

![ApiGateway](https://raw.githubusercontent.com/manustes/coupon-apigateway/master/assets/etapa.png)

- Lambda

![ApiGateway](https://raw.githubusercontent.com/manustes/coupon-apigateway/master/assets/lambda.png)
