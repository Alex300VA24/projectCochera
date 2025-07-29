import flet as ft

def GestionView(titulo, nombre_busqueda, nombre_boton, columnas, datos_tabla, on_buscar):
    # Campo de búsqueda y botón buscar
    campo_busqueda = ft.TextField(
        label=nombre_busqueda,
        prefix_icon=ft.Icons.SEARCH,
        border_radius=10,
        width=300,
        # no filtramos aquí al escribir
    )

    boton_buscar = ft.ElevatedButton(
        text="Buscar",
        on_click=lambda e: on_buscar(campo_busqueda.value)
    )

    filas = [
        ft.DataRow(cells=[ft.DataCell(ft.Text(str(valor))) for valor in fila])
        for fila in datos_tabla
    ]

    tabla = ft.DataTable(
        columns=[ft.DataColumn(ft.Text(col)) for col in columnas],
        rows=filas
    )

    return ft.Column([
        ft.Row([campo_busqueda, boton_buscar], spacing=10),
        ft.Row([ft.Text(titulo, size=28, weight='bold')]),
        ft.Container(
            content=ft.Column([tabla], scroll=ft.ScrollMode.ALWAYS),
            height=400,
            border=ft.border.all(1, ft.Colors.GREY),
            border_radius=10,
            padding=10
        ),
    ])
