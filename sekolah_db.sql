-- =============================================
-- Database: sekolah_db
-- Sistem Manajemen SekolahKU
-- SMK Cerdas Satu Bangsa
-- =============================================

CREATE DATABASE IF NOT EXISTS `sekolah_db` 
DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE `sekolah_db`;

-- =============================================
-- Table: users
-- =============================================

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `school_id` varchar(255) NOT NULL,
  `employment_code` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `role` enum('murid','kepala_sekolah','wakil_sekolah','guru','magang_honor','pusat_jurusan','cashier','operator') NOT NULL DEFAULT 'murid',
  `position_status` varchar(50) DEFAULT NULL,
  `access_role` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `contract_end_date` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_school_id_unique` (`school_id`),
  UNIQUE KEY `users_employment_code_unique` (`employment_code`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_index` (`role`),
  KEY `users_position_status_index` (`position_status`),
  KEY `users_access_role_index` (`access_role`),
  KEY `users_is_active_index` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- Table: school_classes
-- =============================================

CREATE TABLE IF NOT EXISTS `school_classes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `department_name` varchar(255) NOT NULL,
  `grade_level` varchar(50) NOT NULL,
  `capacity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `homeroom_teacher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `school_classes_name_unique` (`name`),
  KEY `school_classes_homeroom_teacher_id_index` (`homeroom_teacher_id`),
  CONSTRAINT `school_classes_homeroom_teacher_id_foreign` FOREIGN KEY (`homeroom_teacher_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- Table: staff_presences
-- =============================================

CREATE TABLE IF NOT EXISTS `staff_presences` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `work_date` date NOT NULL,
  `workflow_type` varchar(20) NOT NULL,
  `attendance_context` varchar(30) NOT NULL DEFAULT 'umum',
  `check_in_at` timestamp NULL DEFAULT NULL,
  `check_out_at` timestamp NULL DEFAULT NULL,
  `total_minutes` int(10) UNSIGNED DEFAULT NULL,
  `location_note` varchar(255) DEFAULT NULL,
  `evidence_photo` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `subject_name` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `staff_presences_user_id_work_date_unique` (`user_id`,`work_date`),
  KEY `staff_presences_workflow_type_work_date_index` (`workflow_type`,`work_date`),
  CONSTRAINT `staff_presences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- Table: staff_activity_logs
-- =============================================

CREATE TABLE IF NOT EXISTS `staff_activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `activity_date` date NOT NULL,
  `workflow_type` varchar(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `approval_status` varchar(20) NOT NULL DEFAULT 'submitted',
  `class_name` varchar(255) DEFAULT NULL,
  `subject_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_activity_logs_user_id_activity_date_index` (`user_id`,`activity_date`),
  KEY `staff_activity_logs_workflow_type_approval_status_index` (`workflow_type`,`approval_status`),
  CONSTRAINT `staff_activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- Table: staff_tasks
-- =============================================

CREATE TABLE IF NOT EXISTS `staff_tasks` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `assigned_to_user_id` bigint(20) UNSIGNED NOT NULL,
  `assigned_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `workflow_type` varchar(20) NOT NULL DEFAULT 'umum',
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'todo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_tasks_assigned_to_user_id_status_index` (`assigned_to_user_id`,`status`),
  KEY `staff_tasks_workflow_type_due_date_index` (`workflow_type`,`due_date`),
  CONSTRAINT `staff_tasks_assigned_to_user_id_foreign` FOREIGN KEY (`assigned_to_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `staff_tasks_assigned_by_user_id_foreign` FOREIGN KEY (`assigned_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- Table: paket_soals
-- =============================================

CREATE TABLE IF NOT EXISTS `paket_soals` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'ujian_harian',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paket_soals_created_by_foreign` (`created_by`),
  CONSTRAINT `paket_soals_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- Table: soals
-- =============================================

CREATE TABLE IF NOT EXISTS `soals` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `paket_soal_id` bigint(20) UNSIGNED NOT NULL,
  `nomor_urut` int(10) UNSIGNED NOT NULL,
  `pertanyaan` text NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `gambar_source` varchar(255) DEFAULT NULL,
  `gambar_status` enum('none','matched','missing') NOT NULL DEFAULT 'none',
  `opsi_a` text NOT NULL,
  `opsi_b` text NOT NULL,
  `opsi_c` text NOT NULL,
  `opsi_d` text NOT NULL,
  `opsi_e` text NOT NULL,
  `kunci_jawaban` enum('A','B','C','D','E') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `soals_paket_soal_id_nomor_urut_unique` (`paket_soal_id`,`nomor_urut`),
  KEY `soals_paket_soal_id_gambar_status_index` (`paket_soal_id`,`gambar_status`),
  CONSTRAINT `soals_paket_soal_id_foreign` FOREIGN KEY (`paket_soal_id`) REFERENCES `paket_soals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- Table: personal_access_tokens (untuk Sanctum)
-- =============================================

CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- Data Dummy untuk Testing
-- =============================================

INSERT INTO `users` (`id`, `school_id`, `employment_code`, `email`, `password`, `gender`, `role`, `position_status`, `access_role`, `name`, `phone`, `contract_end_date`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'superadmin@164990', NULL, 'mjuffrisiregar.1@gmail.com', '$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'L', 'operator', 'tetap', 'operator', 'Super Administrator', '081234567890', NULL, 1, NOW(), NOW()),
(2, 'kepala@654321', NULL, 'kepala@smk.sch.id', '$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'L', 'kepala_sekolah', 'tetap', 'kepala_sekolah', 'Dr. Budi Santoso', '081234567891', NULL, 1, NOW(), NOW()),
(3, 'guru@112233', NULL, 'guru1@smk.sch.id', '$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'P', 'guru', 'tetap', 'guru', 'Siti Nurhaliza', '081234567892', NULL, 1, NOW(), NOW()),
(4, 'ahmad@1234', NULL, 'ahmad@student.smk.sch.id', '$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'L', 'murid', NULL, 'murid', 'Ahmad Fauzi', '081234567893', NULL, 1, NOW(), NOW()),
(5, 'siti@5678', NULL, 'siti@student.smk.sch.id', '$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'P', 'murid', NULL, 'murid', 'Siti Aminah', '081234567894', NULL, 1, NOW(), NOW()),
(6, 'HNR-26-001', 'HNR-26-001', 'honorer.guru@smk.sch.id', '$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'L', 'guru', 'honorer', 'guru', 'Pak Damar Honorer', '081234567895', '2026-12-31', 1, NOW(), NOW()),
(7, 'MGN-26-001', 'MGN-26-001', 'magang.operator@smk.sch.id', '$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'P', 'operator', 'magang', 'operator', 'Ayu Magang IT', '081234567896', '2026-08-31', 1, NOW(), NOW()),
(8, 'akademik@164991', NULL, 'akademik.operator@smk.sch.id', '$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'P', 'operator', 'tetap', 'admin_akademik', 'Nadia Pratama', '081234567899', NULL, 1, NOW(), NOW()),
(9, 'gurupending@334455', NULL, 'guru.pending@gmail.com', '$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'L', 'guru', 'tetap', 'guru', 'Rizky Pending', '081234567810', NULL, 0, NOW(), NOW()),
(10, 'murid@6789', NULL, 'murid.pending@gmail.com', '$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'P', 'murid', NULL, 'murid', 'Alya Pending', '081234567811', NULL, 0, NOW(), NOW());

INSERT INTO `school_classes` (`id`, `name`, `department_name`, `grade_level`, `capacity`, `homeroom_teacher_id`, `created_at`, `updated_at`) VALUES
(1, 'X RPL 1', 'Rekayasa Perangkat Lunak', 'X', 36, 3, NOW(), NOW()),
(2, 'X RPL 2', 'Rekayasa Perangkat Lunak', 'X', 36, NULL, NOW(), NOW()),
(3, 'XI TKJ 1', 'Teknik Komputer & Jaringan', 'XI', 34, NULL, NOW(), NOW()),
(4, 'XII TKV 1', 'Teknik Komunikasi Visual', 'XII', 32, NULL, NOW(), NOW());

-- =============================================
-- Catatan: akun hasil SQL dump ini memakai password default: password
-- Contoh login Admin Akademik - Operator:
-- school_id: akademik@164991
-- password : password
-- =============================================

-- =============================================
-- Indexes untuk Performance
-- =============================================

ALTER TABLE `users` 
ADD INDEX `idx_created_at` (`created_at`),
ADD INDEX `idx_deleted_at` (`deleted_at`);

-- =============================================
-- END OF SQL DUMP
-- =============================================
