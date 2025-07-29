import flet as ft
from icon import CustomSwitch

class MenuGui:
    def __init__(self, page: ft.Page, controller):
        self.page = page
        self.controller = controller  # Referencia al controlador
        

        self.color_container = ft.Colors.BLUE_GREY_900
        self.color_items = ft.Colors.BLUE_GREY_500
        self.color_select_items = ft.Colors.DEEP_ORANGE
        self.color_icons_light = ft.Colors.BLACK
        self.color_icons_dark = ft.Colors.WHITE
        self.animation_style = ft.Animation(400, ft.AnimationCurve.EASE_IN_TO_LINEAR)

        self.mode_switch = CustomSwitch(on_change=self.mode_change_update)

        self.bt_home = ft.Container(
            width=70,
            height=60,
            bgcolor=self.color_container,
            border_radius=10,
            alignment=ft.alignment.center,
            content=ft.IconButton(icon=ft.Icons.HOME,
                                  icon_color=self.color_icons_dark,
                                  on_click=self.bar_icons)
        )

        # Obtener opciones desde el controlador
        self.opciones = controller.get_opciones()

        self.switch_control = {}
        self.containers = []

        for i, (_, texto, _) in enumerate(self.opciones):
            cont = ft.Container(
                bgcolor=self.color_container,
                offset=ft.Offset(0, 2 if i != 0 else 0),  # Solo el primero visible
                animate=self.animation_style,
                border_radius=10,
                padding=10,
                content=None

            )
            self.containers.append(cont)
            self.switch_control[i] = cont
        
        self.vista_dinamica_container = ft.Container(
            expand=True,
            padding=10,
            bgcolor=ft.Colors.BLUE_GREY_900  
        )
        
        # Lo insertamos *solo* en la opción inicial (índice 0)
        self.containers[0].content = self.vista_dinamica_container
        
        self.controller.set_contenedor_vista(self.vista_dinamica_container)


        self.option_buttons = []
        for i, (icon_path, texto, _) in enumerate(self.opciones):
            btn = ft.Container(
                bgcolor=self.color_items,
                border_radius=ft.BorderRadius(top_right=20, bottom_right=20, top_left=0, bottom_left=0),
                animate_scale=self.animation_style,
                on_click=lambda e, idx=i: self.change_page(idx),
                height=50,
                padding=10,
                content=ft.Row(
                    alignment=ft.MainAxisAlignment.CENTER,
                    spacing=15,
                    controls=[
                        ft.Image(src=icon_path, width=32, height=32),
                        ft.Text(texto, width=160, weight=ft.FontWeight.BOLD,)
                    ]
                )
            )
            self.option_buttons.append(btn)

        self.frame_title = ft.Container(
            expand=True,
            height=60,
            bgcolor=self.color_container,
            border_radius=10,
            alignment=ft.alignment.center,
            content=ft.Text("COCHERA DOÑA PETA", size=30, weight=ft.FontWeight.BOLD,)
        )

        self.navigation = ft.Container(
            bgcolor=self.color_container,
            animate_size=self.animation_style,
            width=220,
            border_radius=10,
            padding=10,
            content=ft.Column(
                horizontal_alignment=ft.CrossAxisAlignment.CENTER,
                controls=[
                    ft.Container(
                        expand=True,
                        content=ft.Column(
                            spacing=10,
                            alignment=ft.MainAxisAlignment.START,
                            controls=self.option_buttons
                        )
                    ),
                    self.mode_switch.get_control(),
                ]
            )
        )

        self.frame = ft.Container(
            expand=True,
            content=ft.Stack(
                controls=self.containers
            )
        )

        self.page.add(ft.Column(
            expand=True,
            controls=[
                ft.Row(
                    controls=[
                        self.bt_home,
                        self.frame_title,
                    ]
                ),
                ft.Row(
                    expand=True,
                    controls=[
                        self.navigation,
                        self.frame,
                    ]
                )
            ]
        ))

        self.selected_index = 0

    def bar_icons(self, e):
        current_icon = self.bt_home.content.icon

        if current_icon == ft.Icons.MENU:
            self.bt_home.content.icon = ft.Icons.HOME
            self.navigation.width = 220
        elif current_icon == ft.Icons.HOME:
            self.bt_home.content.icon = ft.Icons.MENU
            self.navigation.width = 70

        self.bt_home.update()
        self.navigation.update()

    def mode_change_update(self, value):
        self.page.theme_mode = ft.ThemeMode.DARK if value else ft.ThemeMode.LIGHT

        if value:  # 🌙 Modo oscuro
            self.color_container = ft.Colors.BLUE_GREY_900
            self.color_items = ft.Colors.BLUE_GREY_700
            self.color_select_items = ft.Colors.BLUE_ACCENT_700
            self.color_icons = self.color_icons_dark
            self.table_header_color = ft.Colors.GREY_300
            self.table_cell_color = ft.Colors.GREY_100
            self.vista_dinamica_container.bgcolor = ft.Colors.BLUE_GREY_800
        else:  # ☀️ Modo claro
            self.color_container = ft.Colors.BLUE_50
            self.color_items = ft.Colors.BLUE_GREY_100
            self.color_select_items = ft.Colors.BLUE_300
            self.color_icons = self.color_icons_light
            self.table_header_color = ft.Colors.BLUE_900
            self.table_cell_color = ft.Colors.BLUE_GREY_800
            self.vista_dinamica_container.bgcolor = ft.Colors.BLUE_100

        # Actualizar botones
        for i, option in enumerate(self.option_buttons):
            text = option.content.controls[1]
            if isinstance(text, ft.Text):
                text.color = self.color_icons
            option.bgcolor = self.color_select_items if i == self.selected_index else self.color_items
            option.update()

        # Actualizar contenedores
        for cont in self.containers:
            cont.bgcolor = self.color_container
            cont.update()

        self.navigation.bgcolor = self.color_container
        self.navigation.update()

        self.frame_title.bgcolor = self.color_container
        self.frame_title.update()

        self.bt_home.bgcolor = self.color_container
        if isinstance(self.bt_home.content, ft.IconButton):
            self.bt_home.content.icon_color = self.color_icons
        self.bt_home.update()

        self.page.update()




    def change_page(self, index):
        for i, cont in self.switch_control.items():
            cont.offset = ft.Offset(0, 2)
            cont.content = None  # ❗ Importante: vaciar
            cont.update()
            self.option_buttons[i].bgcolor = self.color_items

        # Mostrar el contenedor activo
        self.switch_control[index].offset = ft.Offset(0, 0)
        self.switch_control[index].content = self.vista_dinamica_container  # ❗ Mover contenedor dinámico
        self.switch_control[index].update()
        self.option_buttons[index].bgcolor = self.color_select_items
        self.option_buttons[index].update()

        self.selected_index = index

        self.controller.handle_option(index)
        self.page.update()