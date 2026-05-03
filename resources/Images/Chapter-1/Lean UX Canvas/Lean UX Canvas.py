from PIL import Image, ImageDraw, ImageFont

W, H = 1800, 1100
img = Image.new("RGB", (W, H), "#F8F8F8")
draw = ImageDraw.Draw(img)

try:
    font_title  = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", 15)
    font_header = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", 13)
    font_body   = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 11)
    font_bold   = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", 11)
    font_main   = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", 18)
except:
    font_title = font_header = font_body = font_bold = font_main = ImageFont.load_default()

COLS, ROWS = 3, 3
PAD, GAP = 8, 4
TITLE_H, HEADER_H = 60, 28

cell_w = (W - GAP*(COLS+1)) // COLS
cell_h = (H - TITLE_H - GAP*(ROWS+1)) // ROWS

cells = [
    {
        "title": "Problema de negocio",
        "color": "#DBEAFE", "tcolor": "#1E3A8A",
        "lines": [
            ("En Latinoamérica, el 75% de las startups fracasan antes de dos años por:", False),
            ("• Dificultad para conformar equipos cohesionados (23%)", False),
            ("• Gestión ineficiente de recursos (20%)", False),
            ("• Conflictos entre miembros del equipo (21%)", False),
            ("• Ausencia de plataformas que integren formación de", False),
            ("  equipos, gestión y seguimiento transparente", False),
        ]
    },
    {
        "title": "Ideas de solución",
        "color": "#D1FAE5", "tcolor": "#065F46",
        "lines": [
            ("• Plataforma web de colaboración y gestión de proyectos", False),
            ("• Módulo de creación y gestión con hitos y evidencias", False),
            ("• Sistema de hitos, reportes y reputación para usuarios", False),
            ("  y proyectos", False),
            ("• Módulo IoT de monitoreo de impacto ambiental", False),
            ("  en tiempo real", False),
        ]
    },
    {
        "title": "Resultados comerciales",
        "color": "#FDE8D8", "tcolor": "#92400E",
        "lines": [
            ("• Al menos 15% de conversión a premium en el primer año", False),
            ("• 2,000 usuarios activos y 500 proyectos publicados", False),
            ("  en seis meses", False),
            ("• Sostenibilidad mediante planes premium", False),
            ("• 40% de proyectos ambientales activen el módulo IoT", False),
            ("  en los primeros seis meses", False),
        ]
    },
    {
        "title": "Usuarios y clientes",
        "color": "#EDE9FE", "tcolor": "#4C1D95",
        "lines": [
            ("• Emprendedores (18–25 años): buscan colaboradores y", False),
            ("  herramientas para gestionar sus proyectos", False),
            ("• Estudiantes universitarios (18–25 años): buscan ganar", False),
            ("  experiencia en proyectos reales", False),
            ("• Proyectos sostenibles: equipos con enfoque ambiental", False),
            ("  que buscan medir su impacto", False),
        ]
    },
    {
        "title": "Lo más importante que necesitamos aprender",
        "color": "#FEF3C7", "tcolor": "#78350F",
        "lines": [
            ("Debemos validar si los usuarios valoran una plataforma que", False),
            ("combine formación de equipos multidisciplinarios y gestión", False),
            ("transparente de proyectos en un solo ecosistema, y si el", False),
            ("módulo IoT es un diferenciador real frente a soluciones", False),
            ("actuales en el mercado latinoamericano.", False),
        ]
    },
    {
        "title": "Beneficios del usuario",
        "color": "#D1FAE5", "tcolor": "#065F46",
        "lines": [
            ("• Acceso a colaboradores con habilidades complementarias", False),
            ("• Creación de equipos sólidos y multidisciplinarios", False),
            ("• Transparencia mediante hitos y reputaciones verificadas", False),
            ("• Oportunidades de networking y expansión de redes", False),
            ("• Visibilidad del impacto ambiental de proyectos", False),
            ("  sostenibles vía IoT", False),
        ]
    },
    {
        "title": "Hipótesis",
        "color": "#FCE7F3", "tcolor": "#831843",
        "lines": [
            ("• Si habilitamos funcionalidades de equipos, los proyectos", False),
            ("  tendrán mayor probabilidad de éxito", False),
            ("• Si desarrollamos una interfaz intuitiva, más usuarios", False),
            ("  adoptarán la plataforma", False),
            ("• Si incluimos seguimiento de hitos y reputación,", False),
            ("  generaremos confianza y participación recurrente", False),
            ("• Si incorporamos el módulo IoT, los proyectos ambientales", False),
            ("  generarán mayor credibilidad y engagement", False),
        ]
    },
    {
        "title": "La menor cantidad de trabajo para aprender",
        "color": "#FEF3C7", "tcolor": "#78350F",
        "lines": [
            ("• Entrevistas con al menos 3 usuarios por segmento", False),
            ("• Encuestas en comunidades de emprendedores y", False),
            ("  universidades para medir interés en funcionalidades", False),
            ("• Prototipos de baja fidelidad para evaluar prioridades", False),
            ("• Prueba piloto del módulo IoT con proyectos ambientales", False),
            ("  reales para validar su valor diferencial", False),
        ]
    },
    {
        "title": "Modelo de negocio",
        "color": "#E0F2FE", "tcolor": "#0C4A6E",
        "lines": [
            ("• Freemium: hasta 5 postulaciones o publicaciones gratuitas", False),
            ("• Premium: métricas avanzadas, postulaciones ilimitadas", False),
            ("  y mayor visibilidad", False),
            ("• Inversión inicial estimada: USD $18,000", False),
        ]
    },
]

draw.rectangle([0, 0, W, TITLE_H], fill="#1E293B")
draw.text((PAD*2, 18), "1.2.2.4. Lean UX Canvas — Foundly", font=font_main, fill="white")

for i, cell in enumerate(cells):
    row = i // COLS
    col = i % COLS
    x = GAP + col * (cell_w + GAP)
    y = TITLE_H + GAP + row * (cell_h + GAP)

    draw.rectangle([x, y, x+cell_w, y+cell_h], fill="white", outline="#CBD5E1", width=1)
    draw.rectangle([x, y, x+cell_w, y+HEADER_H], fill=cell["color"])
    tw = draw.textlength(cell["title"], font=font_header)
    tx = x + (cell_w - tw) // 2
    draw.text((tx, y+7), cell["title"], font=font_header, fill=cell["tcolor"])

    cy = y + HEADER_H + 8
    for line, bold in cell["lines"]:
        f = font_bold if bold else font_body
        draw.text((x+PAD, cy), line, font=f, fill="#374151")
        cy += 14

img.save("lean_ux_canvas_foundly.png", dpi=(150, 150))
print("Done")
