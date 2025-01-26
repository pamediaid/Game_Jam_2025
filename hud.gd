extends Control

@onready var stamina = $staminabar

var can_regen = false
var time_to_wait = 1  # Waktu tunggu sebelum regenerasi stamina
var s_timer = 0  # Timer untuk menghitung waktu tunggu
var regen_timer = 0  # Timer untuk mengatur jeda antar-regen
var regen_interval = 3  # Waktu jeda antar-penambahan stamina (2 detik)
var regen_amount = 1  # Jumlah stamina yang diregenerasi per langkah
var can_start_stimer = true  # Apakah timer regenerasi bisa dimulai

# Called when the node enters the scene tree for the first time.
func _ready():
	# Inisialisasi stamina bar ke nilai maksimal
	stamina.value = stamina.max_value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Jika regenerasi stamina tidak diizinkan dan stamina belum penuh
	if not can_regen and stamina.value < stamina.max_value:
		if can_start_stimer:
			s_timer += delta
			if s_timer >= time_to_wait:
				can_regen = true
				can_start_stimer = false
				s_timer = 0

	# Jika stamina penuh, hentikan regenerasi
	if stamina.value == stamina.max_value:
		can_regen = false

	# Jika regenerasi stamina diizinkan
	if can_regen:
		regen_timer += delta
		if regen_timer >= regen_interval:  # Hanya regen setelah interval tertentu (2 detik)
			stamina.value = min(stamina.max_value, stamina.value + regen_amount)  # Tambahkan stamina
			regen_timer = 0  # Reset regen_timer
			if stamina.value == stamina.max_value:
				can_regen = false  # Berhenti regenerasi jika sudah penuh

	# Jika pemain menekan tombol "Jump"
	if Input.is_action_just_pressed("Jump"):
		stamina.value = max(0, stamina.value - 1)  # Kurangi stamina sesuai kebutuhan, pastikan tidak di bawah 0
		can_regen = false
		can_start_stimer = true  # Timer regenerasi bisa dimulai lagi
		s_timer = 0
