# MeLi Mobile Challenge

El desafío consistió en desarrollar una app que, utilizando las APIs de MercadoLibre, permita al usuario buscar un producto y ver los detalles del mismo.
Dicha app cuenta con tres pantallas:

1) Campo de búsqueda.
2) Visualización de resultados de la búsqueda.
3) Detalle del producto.

# Arquitectura

Se utilizó la arquitectura MVVM, ya que la misma permite separar de forma efectiva la vista (UIViewController + Views) de la lógica de negocio (ViewModel) al mismo tiempo
que mantiene los modelos lo más compactos posible. La app hace uso de Light/Dark y modifica la UI en base a la configuración elegida por el usuario.

Minimum iOS Version: 12.0 
Considero que esta versión cuenta con la mejor relación entre features y nivel de adopción de usuarios (compatibilidad).

# Dependencias

- AlamoFire: Para realizar pedidos al servidor.
- Snapkit: Para simplificar el uso de layout constraints.
- PromiseKit: Para manejar pedidos asincrónicos y manejo de errores.
- SDWebImage: Para facilitar la descarga y utilización de imágenes.

# Screens

| Campo de búsqueda  | Resultados de la búsqueda |  Detalle del producto  |
| ------------- | ------------- | -------------- |
| ![Screen1](https://user-images.githubusercontent.com/81202273/116756561-8cc25a00-a9c9-11eb-9e7a-84141746175e.png)  | ![Screen2](https://user-images.githubusercontent.com/81202273/116756569-8fbd4a80-a9c9-11eb-94ce-cbde67125ec2.png)  |  ![Screen3](https://user-images.githubusercontent.com/81202273/116756574-921fa480-a9c9-11eb-8caa-23058047f29b.png)  |




