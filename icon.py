import flet as ft

class CustomSwitch:
    def __init__(self, on_change=None, initial_value=True):
        self.value = initial_value
        self.on_change = on_change

        self.thumb_icon = ft.Icon(
            name=ft.Icons.LIGHT_MODE if self.value else ft.Icons.DARK_MODE,
            color=ft.Colors.WHITE,
            size=18
        )

        self.thumb = ft.Container(
            width=36,
            height=36,
            bgcolor=ft.Colors.DEEP_ORANGE,
            border_radius=18,
            alignment=ft.alignment.center,
            left=40 if self.value else 0,
            content=self.thumb_icon,
            animate_position=300
        )

        self.track = ft.Container(
            width=80,
            height=36,
            bgcolor=ft.Colors.BLUE_GREY_500,
            border_radius=20,
            padding=2,
            content=ft.Stack(controls=[self.thumb])
        )

        self.switch = ft.GestureDetector(
            on_tap=self.toggle,
            content=self.track
        )

    def toggle(self, e):
        self.value = not self.value
        self.thumb.left = 40 if self.value else 0
        self.thumb_icon.name = ft.Icons.LIGHT_MODE if self.value else ft.Icons.DARK_MODE
        e.control.page.update()

        if self.on_change:
            self.on_change(self.value)

    def get_control(self):
        return self.switch

