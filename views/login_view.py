import flet as ft

def login_view(page: ft.Page, on_login_callback):
    page.clean()
    page.bgcolor = "#F4F4F4"

    def mostrar_mensaje(mensaje, exito=True):
        color = "green" if exito else "red"
        page.snack_bar = ft.SnackBar(
            content=ft.Text(mensaje, color="white"),
            bgcolor=color,
            open=True
        )
        page.update()

    titulo_barra = ft.AppBar(
        title=ft.Text("COCHERA DOÑA PETA", color="white", weight="bold", size=20),
        bgcolor="#8B0000",
        center_title=True
    )

    dni_field = ft.TextField(
        label="DNI",
        width=300,
        height=50,
        border_color="#8B0000",
        color="black"
    )

    password_field = ft.TextField(
        label="Contraseña",
        password=True,
        width=300,
        height=50,
        border_color="#8B0000",
        color="black"
    )

    def manejar_login(e):
        dni = dni_field.value
        password = password_field.value
        on_login_callback(dni, password, mostrar_mensaje)

    boton_login = ft.ElevatedButton(
        text="Iniciar Sesión",
        color="white",
        bgcolor="#8B0000",
        width=200,
        height=45,
        on_click=manejar_login
    )

    contenido_login = ft.Container(
        content=ft.Column(
            [
                ft.Text("ADMINISTRADOR", size=26, weight="bold", color="#333333", text_align="center"),
                ft.Text("Ingresar al Sistema", size=18, color="#666666", text_align="center"),
                dni_field,
                password_field,
                ft.Container(content=boton_login, alignment=ft.alignment.center)
            ],
            alignment=ft.MainAxisAlignment.CENTER,
            horizontal_alignment=ft.CrossAxisAlignment.CENTER,
            spacing=20
        ),
        padding=30,
        width=380,
        border_radius=20,
        bgcolor="white",
        shadow=ft.BoxShadow(blur_radius=25, color="#00000025", spread_radius=3),
        alignment=ft.alignment.center,
    )

    page.add(
        titulo_barra,
        ft.Container(
            content=contenido_login,
            alignment=ft.alignment.center,
            expand=True
        )
    )
