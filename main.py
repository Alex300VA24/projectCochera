import flet as ft
from controllers.login_controller import show_login

def main(page: ft.Page):
    show_login(page)

ft.app(target=main)
