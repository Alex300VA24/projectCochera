from views.login_view import login_view
from models.login_model import LoginModel
from controllers.menu_controller import show_menu

def show_login(page):
    model = LoginModel()

    def on_login_success(dni, password, mostrar_mensaje):
        resultado = model.autenticar(dni, password)

        if resultado["exito"]:
            mostrar_mensaje("Inicio de sesión exitoso")
            show_menu(page)
        else:
            mostrar_mensaje(resultado["mensaje"], exito=False)

    login_view(page, on_login_callback=on_login_success)
