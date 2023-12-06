SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `xf_activity_summary_definition` (
  `definition_id` varbinary(50) NOT NULL,
  `definition_class` varchar(100) NOT NULL,
  `addon_id` varbinary(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_activity_summary_section` (
  `section_id` int(10) UNSIGNED NOT NULL,
  `definition_id` varbinary(50) NOT NULL,
  `display_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `show_value` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `options` blob NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_addon` (
  `addon_id` varbinary(50) NOT NULL,
  `title` varchar(75) NOT NULL,
  `version_string` varchar(30) NOT NULL DEFAULT '',
  `version_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `json_hash` varbinary(64) NOT NULL DEFAULT '',
  `active` tinyint(3) UNSIGNED NOT NULL,
  `is_legacy` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `is_processing` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `last_pending_action` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_addon_install_batch` (
  `batch_id` int(10) UNSIGNED NOT NULL,
  `start_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `complete_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `addon_ids` mediumblob NOT NULL,
  `results` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_admin` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `extra_user_group_ids` varbinary(255) NOT NULL,
  `last_login` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `permission_cache` mediumblob DEFAULT NULL,
  `admin_language_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `advanced` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `is_super_admin` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_admin_log` (
  `admin_log_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL DEFAULT '',
  `request_date` int(10) UNSIGNED NOT NULL,
  `request_url` text NOT NULL,
  `request_data` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_admin_navigation` (
  `navigation_id` varbinary(50) NOT NULL,
  `parent_navigation_id` varbinary(50) NOT NULL,
  `display_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `link` varchar(50) NOT NULL DEFAULT '',
  `icon` varchar(50) NOT NULL DEFAULT '',
  `admin_permission_id` varbinary(25) NOT NULL DEFAULT '',
  `debug_only` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `development_only` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `hide_no_children` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `addon_id` varbinary(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_admin_permission` (
  `admin_permission_id` varbinary(25) NOT NULL,
  `display_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `addon_id` varbinary(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_admin_permission_entry` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `admin_permission_id` varbinary(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_advertising` (
  `ad_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `position_id` varbinary(50) NOT NULL,
  `ad_html` text NOT NULL,
  `display_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `display_criteria` blob NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_advertising_position` (
  `position_id` varbinary(50) NOT NULL,
  `arguments` blob NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL,
  `addon_id` varbinary(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_api_attachment_key` (
  `attachment_key` varbinary(32) NOT NULL,
  `create_date` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `temp_hash` varbinary(32) NOT NULL,
  `content_type` varbinary(25) NOT NULL,
  `context` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_api_key` (
  `api_key_id` int(10) UNSIGNED NOT NULL,
  `api_key` varbinary(32) NOT NULL,
  `api_key_hash` varbinary(20) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `is_super_user` tinyint(3) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `allow_all_scopes` tinyint(3) UNSIGNED NOT NULL,
  `scopes` mediumblob NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL,
  `creation_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `creation_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_use_date` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_api_key_scope` (
  `api_key_id` int(10) UNSIGNED NOT NULL,
  `api_scope_id` varbinary(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_api_login_token` (
  `login_token_id` int(10) UNSIGNED NOT NULL,
  `login_token` varbinary(32) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `expiry_date` int(10) UNSIGNED NOT NULL,
  `limit_ip` varbinary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_api_scope` (
  `api_scope_id` varbinary(50) NOT NULL,
  `addon_id` varbinary(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_approval_queue` (
  `content_type` varbinary(25) NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `content_date` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_attachment` (
  `attachment_id` int(10) UNSIGNED NOT NULL,
  `data_id` int(10) UNSIGNED NOT NULL,
  `content_type` varbinary(25) NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `attach_date` int(10) UNSIGNED NOT NULL,
  `temp_hash` varchar(32) NOT NULL DEFAULT '',
  `unassociated` tinyint(3) UNSIGNED NOT NULL,
  `view_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_attachment_data` (
  `data_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `upload_date` int(10) UNSIGNED NOT NULL,
  `filename` varchar(100) NOT NULL,
  `file_size` bigint(20) UNSIGNED NOT NULL,
  `file_hash` varchar(32) NOT NULL,
  `file_path` varchar(250) NOT NULL DEFAULT '',
  `width` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `height` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `thumbnail_width` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `thumbnail_height` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `attach_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_attachment_view` (
  `attachment_id` int(10) UNSIGNED NOT NULL,
  `total` int(10) UNSIGNED NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_ban_email` (
  `banned_email` varchar(120) NOT NULL,
  `create_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `create_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `reason` varchar(255) NOT NULL DEFAULT '',
  `last_triggered_date` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_bb_code` (
  `bb_code_id` varbinary(25) NOT NULL,
  `bb_code_mode` varchar(25) NOT NULL,
  `has_option` varchar(25) NOT NULL,
  `replace_html` text NOT NULL,
  `replace_html_email` text NOT NULL,
  `replace_text` text NOT NULL,
  `callback_class` varchar(100) NOT NULL DEFAULT '',
  `callback_method` varchar(75) NOT NULL DEFAULT '',
  `option_regex` text NOT NULL,
  `trim_lines_after` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `plain_children` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `disable_smilies` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `disable_nl2br` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `disable_autolink` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `allow_empty` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `allow_signature` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `editor_icon_type` varchar(25) NOT NULL DEFAULT '',
  `editor_icon_value` varchar(150) NOT NULL DEFAULT '',
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `addon_id` varbinary(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_bb_code_media_site` (
  `media_site_id` varbinary(25) NOT NULL,
  `site_title` varchar(50) NOT NULL,
  `site_url` varchar(100) NOT NULL DEFAULT '',
  `match_urls` text NOT NULL,
  `match_is_regex` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'If 1, match_urls will be treated as regular expressions rather than simple URL matches.',
  `oembed_enabled` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `oembed_api_endpoint` varbinary(250) NOT NULL DEFAULT '',
  `oembed_url_scheme` varbinary(250) NOT NULL DEFAULT '',
  `oembed_retain_scripts` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `match_callback_class` varchar(100) NOT NULL DEFAULT '',
  `match_callback_method` varchar(75) NOT NULL DEFAULT '',
  `embed_html_callback_class` varchar(100) NOT NULL DEFAULT '',
  `embed_html_callback_method` varchar(75) NOT NULL DEFAULT '',
  `cookie_third_parties` varchar(250) NOT NULL DEFAULT '',
  `supported` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'If 0, this media type will not be listed as available, but will still be usable.',
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `addon_id` varbinary(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_bookmark_item` (
  `bookmark_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `content_type` varbinary(25) NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `bookmark_date` int(10) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `labels` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_bookmark_label` (
  `label_id` int(10) UNSIGNED NOT NULL,
  `label` varchar(100) NOT NULL,
  `label_url` varchar(100) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `use_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_use_date` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_bookmark_label_use` (
  `label_id` int(10) UNSIGNED NOT NULL,
  `bookmark_id` int(10) UNSIGNED NOT NULL,
  `use_date` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_captcha_log` (
  `hash` varbinary(40) NOT NULL,
  `captcha_type` varchar(250) NOT NULL,
  `captcha_data` varchar(250) NOT NULL,
  `captcha_date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_captcha_question` (
  `captcha_question_id` int(10) UNSIGNED NOT NULL,
  `question` varchar(250) NOT NULL,
  `answers` blob NOT NULL COMMENT 'Serialized array of possible correct answers.',
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_category` (
  `node_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_change_log` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `content_type` varbinary(25) NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `edit_user_id` int(10) UNSIGNED NOT NULL,
  `edit_date` int(10) UNSIGNED NOT NULL,
  `field` varchar(100) NOT NULL DEFAULT '',
  `old_value` text NOT NULL,
  `new_value` text NOT NULL,
  `protected` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_class_extension` (
  `extension_id` int(10) UNSIGNED NOT NULL,
  `from_class` varchar(100) NOT NULL,
  `to_class` varchar(100) NOT NULL,
  `execute_order` int(10) UNSIGNED NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL,
  `addon_id` varbinary(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_code_event` (
  `event_id` varbinary(50) NOT NULL,
  `description` text NOT NULL,
  `addon_id` varbinary(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_code_event_listener` (
  `event_listener_id` int(10) UNSIGNED NOT NULL,
  `event_id` varbinary(50) NOT NULL,
  `execute_order` int(10) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `callback_class` varchar(100) NOT NULL,
  `callback_method` varchar(75) NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL,
  `addon_id` varbinary(50) NOT NULL,
  `hint` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_connected_account_provider` (
  `provider_id` varbinary(25) NOT NULL,
  `provider_class` varchar(100) NOT NULL,
  `display_order` smallint(5) UNSIGNED NOT NULL,
  `options` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_content_spam_cache` (
  `spam_cache_id` int(10) UNSIGNED NOT NULL,
  `content_type` varbinary(25) NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `spam_params` mediumblob NOT NULL,
  `insert_date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_content_type_field` (
  `content_type` varbinary(25) NOT NULL,
  `field_name` varbinary(50) NOT NULL,
  `field_value` varchar(75) NOT NULL,
  `addon_id` varbinary(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_content_vote` (
  `vote_id` int(10) UNSIGNED NOT NULL,
  `content_type` varbinary(25) NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `vote_user_id` int(10) UNSIGNED NOT NULL,
  `content_user_id` int(10) UNSIGNED NOT NULL,
  `is_content_user_counted` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `score` int(11) NOT NULL,
  `vote_date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_conversation_master` (
  `conversation_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `start_date` int(10) UNSIGNED NOT NULL,
  `open_invite` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `conversation_open` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `reply_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `recipient_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `first_message_id` int(10) UNSIGNED NOT NULL,
  `last_message_date` int(10) UNSIGNED NOT NULL,
  `last_message_id` int(10) UNSIGNED NOT NULL,
  `last_message_user_id` int(10) UNSIGNED NOT NULL,
  `last_message_username` varchar(50) NOT NULL,
  `recipients` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_conversation_message` (
  `message_id` int(10) UNSIGNED NOT NULL,
  `conversation_id` int(10) UNSIGNED NOT NULL,
  `message_date` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `message` mediumtext NOT NULL,
  `attach_count` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `ip_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `embed_metadata` blob DEFAULT NULL,
  `reaction_score` int(11) NOT NULL DEFAULT 0,
  `reactions` blob DEFAULT NULL,
  `reaction_users` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_conversation_recipient` (
  `conversation_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `recipient_state` enum('active','deleted','deleted_ignored') NOT NULL,
  `last_read_date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_conversation_user` (
  `conversation_id` int(10) UNSIGNED NOT NULL,
  `owner_user_id` int(10) UNSIGNED NOT NULL,
  `is_unread` tinyint(3) UNSIGNED NOT NULL,
  `reply_count` int(10) UNSIGNED NOT NULL,
  `last_message_date` int(10) UNSIGNED NOT NULL,
  `last_message_id` int(10) UNSIGNED NOT NULL,
  `last_message_user_id` int(10) UNSIGNED NOT NULL,
  `last_message_username` varchar(50) NOT NULL,
  `is_starred` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_cookie_consent_log` (
  `cookie_consent_log_id` int(10) UNSIGNED NOT NULL,
  `log_date` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL DEFAULT '',
  `consented_groups` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_cron_entry` (
  `entry_id` varbinary(25) NOT NULL,
  `cron_class` varchar(100) NOT NULL,
  `cron_method` varchar(75) NOT NULL,
  `run_rules` mediumblob NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL,
  `next_run` int(10) UNSIGNED NOT NULL,
  `addon_id` varbinary(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_css_cache` (
  `cache_id` int(10) UNSIGNED NOT NULL,
  `style_id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `title` varbinary(150) NOT NULL,
  `modifier_key` varbinary(32) NOT NULL,
  `output` mediumblob NOT NULL,
  `cache_date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_data_registry` (
  `data_key` varbinary(25) NOT NULL,
  `data_value` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_deletion_log` (
  `content_type` varbinary(25) NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `delete_date` int(10) UNSIGNED NOT NULL,
  `delete_user_id` int(10) UNSIGNED NOT NULL,
  `delete_username` varchar(50) NOT NULL,
  `delete_reason` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_draft` (
  `draft_id` int(10) UNSIGNED NOT NULL,
  `draft_key` varbinary(75) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `last_update` int(10) UNSIGNED NOT NULL,
  `message` mediumtext NOT NULL,
  `extra_data` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_editor_dropdown` (
  `cmd` varbinary(50) NOT NULL,
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT 'Optional icon',
  `buttons` blob NOT NULL,
  `display_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_edit_history` (
  `edit_history_id` int(10) UNSIGNED NOT NULL,
  `content_type` varbinary(25) NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `edit_user_id` int(10) UNSIGNED NOT NULL,
  `edit_date` int(10) UNSIGNED NOT NULL,
  `old_text` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_email_bounce_log` (
  `bounce_id` int(10) UNSIGNED NOT NULL,
  `log_date` int(10) UNSIGNED NOT NULL,
  `email_date` int(10) UNSIGNED NOT NULL,
  `message_type` varchar(25) NOT NULL,
  `action_taken` varchar(25) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `recipient` varchar(255) DEFAULT NULL,
  `raw_message` mediumblob NOT NULL,
  `status_code` varchar(25) DEFAULT NULL,
  `diagnostic_info` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_email_bounce_soft` (
  `bounce_soft_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `bounce_date` date NOT NULL,
  `bounce_total` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_error_log` (
  `error_id` int(10) UNSIGNED NOT NULL,
  `exception_date` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL DEFAULT '',
  `exception_type` varchar(75) NOT NULL,
  `message` text NOT NULL,
  `filename` varchar(255) NOT NULL,
  `line` int(10) UNSIGNED NOT NULL,
  `trace_string` mediumtext NOT NULL,
  `request_state` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_feed` (
  `feed_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(250) NOT NULL,
  `url` varchar(2083) NOT NULL,
  `frequency` int(10) UNSIGNED NOT NULL DEFAULT 1800,
  `node_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `prefix_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title_template` varchar(250) NOT NULL DEFAULT '',
  `message_template` mediumtext NOT NULL,
  `discussion_visible` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `discussion_open` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `discussion_sticky` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `last_fetch` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `active` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_feed_log` (
  `feed_id` int(10) UNSIGNED NOT NULL,
  `unique_id` varbinary(250) NOT NULL,
  `hash` char(32) NOT NULL COMMENT 'MD5(title + content)',
  `thread_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_file_check` (
  `check_id` int(10) UNSIGNED NOT NULL,
  `check_date` int(10) UNSIGNED NOT NULL,
  `check_state` enum('pending','success','failure') NOT NULL DEFAULT 'pending',
  `check_hash` varbinary(64) NOT NULL DEFAULT '',
  `total_missing` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_inconsistent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_checked` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_find_new` (
  `find_new_id` int(10) UNSIGNED NOT NULL,
  `content_type` varbinary(25) NOT NULL,
  `filters` mediumblob NOT NULL,
  `filter_hash` varbinary(32) NOT NULL DEFAULT '',
  `user_id` int(10) UNSIGNED NOT NULL,
  `results` mediumblob NOT NULL,
  `cache_date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_find_new_default` (
  `find_new_default_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `content_type` varbinary(25) NOT NULL,
  `filters` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_flood_check` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `flood_action` varchar(25) NOT NULL,
  `flood_time` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_forum` (
  `node_id` int(10) UNSIGNED NOT NULL,
  `discussion_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_post_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Most recent post_id',
  `last_post_date` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Date of most recent post',
  `last_post_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'User_id of user posting most recently',
  `last_post_username` varchar(50) NOT NULL DEFAULT '' COMMENT 'Username of most recently-posting user',
  `last_thread_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Most recent thread_id',
  `last_thread_title` varchar(150) NOT NULL DEFAULT '' COMMENT 'Title of thread most recent post is in',
  `last_thread_prefix_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `forum_type_id` varbinary(50) NOT NULL DEFAULT 'discussion',
  `type_config` mediumblob NOT NULL,
  `moderate_threads` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `moderate_replies` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `allow_posting` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `count_messages` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'If not set, messages posted (directly) within this forum will not contribute to user message totals.',
  `find_new` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Include posts from this forum when running /find-new/threads',
  `allow_index` enum('allow','deny','criteria') NOT NULL DEFAULT 'allow',
  `index_criteria` blob NOT NULL,
  `field_cache` mediumblob NOT NULL COMMENT 'Serialized data from xf_thread_field',
  `prefix_cache` mediumblob NOT NULL COMMENT 'Serialized data from xf_forum_prefix, [group_id][prefix_id] => prefix_id',
  `prompt_cache` mediumblob NOT NULL COMMENT 'JSON data from xf_forum_prompt',
  `default_prefix_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `default_sort_order` varchar(25) NOT NULL DEFAULT 'last_post_date',
  `default_sort_direction` varchar(5) NOT NULL DEFAULT 'desc',
  `list_date_limit_days` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `require_prefix` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `allowed_watch_notifications` varchar(10) NOT NULL DEFAULT 'all',
  `min_tags` smallint(5) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_forum_field` (
  `node_id` int(10) UNSIGNED NOT NULL,
  `field_id` varbinary(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_forum_prefix` (
  `node_id` int(10) UNSIGNED NOT NULL,
  `prefix_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_forum_prompt` (
  `node_id` int(10) UNSIGNED NOT NULL,
  `prompt_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_forum_read` (
  `forum_read_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `node_id` int(10) UNSIGNED NOT NULL,
  `forum_read_date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_forum_type` (
  `forum_type_id` varbinary(50) NOT NULL,
  `handler_class` varchar(100) NOT NULL,
  `addon_id` varbinary(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_forum_watch` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `node_id` int(10) UNSIGNED NOT NULL,
  `notify_on` enum('','thread','message') NOT NULL,
  `send_alert` tinyint(3) UNSIGNED NOT NULL,
  `send_email` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_help_page` (
  `page_id` varbinary(50) NOT NULL,
  `page_name` varchar(50) NOT NULL,
  `display_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `callback_class` varchar(100) NOT NULL DEFAULT '',
  `callback_method` varchar(75) NOT NULL DEFAULT '',
  `advanced_mode` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `addon_id` varbinary(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_image_proxy` (
  `image_id` int(10) UNSIGNED NOT NULL,
  `url` text NOT NULL,
  `url_hash` varbinary(32) NOT NULL,
  `file_size` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `file_name` varchar(250) NOT NULL DEFAULT '',
  `file_hash` varchar(32) NOT NULL DEFAULT '',
  `mime_type` varchar(100) NOT NULL DEFAULT '',
  `fetch_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `first_request_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_request_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pruned` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_processing` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `failed_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `fail_count` smallint(5) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_image_proxy_referrer` (
  `referrer_id` int(10) UNSIGNED NOT NULL,
  `image_id` int(10) UNSIGNED NOT NULL,
  `referrer_hash` varbinary(32) NOT NULL,
  `referrer_url` text NOT NULL,
  `hits` int(10) UNSIGNED NOT NULL,
  `first_date` int(10) UNSIGNED NOT NULL,
  `last_date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_ip` (
  `ip_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `content_type` varbinary(25) NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `action` varbinary(25) NOT NULL DEFAULT '',
  `ip` varbinary(16) NOT NULL,
  `log_date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_ip_match` (
  `ip` varchar(43) NOT NULL,
  `match_type` enum('banned','discouraged') NOT NULL DEFAULT 'banned',
  `first_byte` binary(1) NOT NULL,
  `start_range` varbinary(16) NOT NULL,
  `end_range` varbinary(16) NOT NULL,
  `create_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `create_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `reason` varchar(255) NOT NULL DEFAULT '',
  `last_triggered_date` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_job` (
  `job_id` int(10) UNSIGNED NOT NULL,
  `unique_key` varbinary(50) DEFAULT NULL,
  `execute_class` varchar(100) NOT NULL,
  `execute_data` mediumblob NOT NULL,
  `manual_execute` tinyint(3) UNSIGNED NOT NULL,
  `trigger_date` int(10) UNSIGNED NOT NULL,
  `last_run_date` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_json_convert_error` (
  `error_id` int(10) UNSIGNED NOT NULL,
  `table_name` varbinary(100) NOT NULL,
  `column_name` varbinary(100) NOT NULL,
  `pk_id` int(10) UNSIGNED NOT NULL,
  `original_value` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_language` (
  `language_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL,
  `parent_list` varbinary(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `date_format` varchar(30) NOT NULL,
  `time_format` varchar(15) NOT NULL,
  `currency_format` varchar(30) NOT NULL,
  `decimal_point` varchar(1) NOT NULL,
  `thousands_separator` varchar(1) NOT NULL,
  `phrase_cache` mediumblob NOT NULL,
  `language_code` varchar(25) NOT NULL DEFAULT '',
  `text_direction` enum('LTR','RTL') NOT NULL DEFAULT 'LTR',
  `week_start` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Week start day. 0 = Sunday, 6 = Saturday',
  `label_separator` varchar(15) NOT NULL DEFAULT ':',
  `comma_separator` varchar(15) NOT NULL DEFAULT ', ',
  `ellipsis` varchar(15) NOT NULL DEFAULT '...',
  `parenthesis_open` varchar(15) NOT NULL DEFAULT '(',
  `parenthesis_close` varchar(15) NOT NULL DEFAULT ')',
  `user_selectable` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_link_forum` (
  `node_id` int(10) UNSIGNED NOT NULL,
  `link_url` varchar(150) NOT NULL,
  `redirect_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_link_proxy` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `url` text NOT NULL,
  `url_hash` varbinary(32) NOT NULL,
  `first_request_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_request_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_link_proxy_referrer` (
  `referrer_id` int(10) UNSIGNED NOT NULL,
  `link_id` int(10) UNSIGNED NOT NULL,
  `referrer_hash` varbinary(32) NOT NULL,
  `referrer_url` text NOT NULL,
  `hits` int(10) UNSIGNED NOT NULL,
  `first_date` int(10) UNSIGNED NOT NULL,
  `last_date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_login_attempt` (
  `attempt_id` int(10) UNSIGNED NOT NULL,
  `login` varchar(60) NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `attempt_date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_mail_queue` (
  `mail_queue_id` int(10) UNSIGNED NOT NULL,
  `mail_data` mediumblob NOT NULL,
  `queue_date` int(10) UNSIGNED NOT NULL,
  `send_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `fail_date` int(10) UNSIGNED DEFAULT NULL,
  `fail_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_member_stat` (
  `member_stat_id` int(10) UNSIGNED NOT NULL,
  `member_stat_key` varbinary(50) NOT NULL,
  `criteria` blob DEFAULT NULL,
  `callback_class` varchar(100) NOT NULL DEFAULT '',
  `callback_method` varchar(75) NOT NULL DEFAULT '',
  `visibility_class` varchar(100) NOT NULL DEFAULT '',
  `visibility_method` varchar(75) NOT NULL DEFAULT '',
  `sort_order` varchar(50) NOT NULL DEFAULT 'message_count',
  `sort_direction` varchar(5) NOT NULL DEFAULT 'desc',
  `permission_limit` varbinary(51) NOT NULL DEFAULT '',
  `show_value` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `user_limit` int(10) UNSIGNED NOT NULL DEFAULT 20,
  `display_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `addon_id` varbinary(50) NOT NULL DEFAULT '',
  `overview_display` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `cache_lifetime` int(10) UNSIGNED NOT NULL DEFAULT 60,
  `cache_expiry` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cache_results` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_moderator` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `is_super_moderator` tinyint(3) UNSIGNED NOT NULL,
  `extra_user_group_ids` varbinary(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_moderator_content` (
  `moderator_id` int(10) UNSIGNED NOT NULL,
  `content_type` varbinary(25) NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_moderator_log` (
  `moderator_log_id` int(10) UNSIGNED NOT NULL,
  `log_date` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL DEFAULT '',
  `content_type` varbinary(25) NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `content_user_id` int(10) UNSIGNED NOT NULL,
  `content_username` varchar(50) NOT NULL,
  `content_title` varchar(150) NOT NULL,
  `content_url` text NOT NULL,
  `discussion_content_type` varchar(25) NOT NULL,
  `discussion_content_id` int(10) UNSIGNED NOT NULL,
  `action` varchar(25) NOT NULL,
  `action_params` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_navigation` (
  `navigation_id` varbinary(50) NOT NULL,
  `parent_navigation_id` varbinary(50) NOT NULL,
  `display_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `navigation_type_id` varbinary(25) NOT NULL,
  `type_config` mediumtext NOT NULL,
  `condition_expression` mediumblob NOT NULL,
  `condition_setup` mediumblob NOT NULL,
  `data_expression` mediumblob NOT NULL,
  `data_setup` mediumblob NOT NULL,
  `global_setup` mediumblob NOT NULL,
  `enabled` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `is_customized` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `default_value` mediumblob NOT NULL,
  `addon_id` varbinary(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_navigation_type` (
  `navigation_type_id` varbinary(25) NOT NULL,
  `handler_class` varchar(100) NOT NULL,
  `display_order` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_news_feed` (
  `news_feed_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL COMMENT 'The user who performed the action',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT 'Corresponds to user_id',
  `content_type` varbinary(25) NOT NULL COMMENT 'eg: thread',
  `content_id` int(10) UNSIGNED NOT NULL,
  `action` varchar(25) NOT NULL COMMENT 'eg: edit',
  `event_date` int(10) UNSIGNED NOT NULL,
  `extra_data` mediumblob NOT NULL COMMENT 'Serialized. Stores any extra data relevant to the action'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_node` (
  `node_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `node_name` varchar(50) DEFAULT NULL COMMENT 'Unique column used as string ID by some node types',
  `node_type_id` varbinary(25) NOT NULL,
  `parent_node_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `display_order` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `display_in_list` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'If 0, hidden from node list. Still counts for lft/rgt.',
  `lft` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Nested set info ''left'' value',
  `rgt` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Nested set info ''right'' value',
  `depth` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Depth = 0: no parent',
  `style_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Style override for specific node',
  `effective_style_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Style override; pushed down tree',
  `breadcrumb_data` blob DEFAULT NULL,
  `navigation_id` varbinary(50) NOT NULL DEFAULT '',
  `effective_navigation_id` varbinary(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_node_type` (
  `node_type_id` varbinary(25) NOT NULL,
  `entity_identifier` varchar(75) NOT NULL,
  `permission_group_id` varchar(25) NOT NULL DEFAULT '',
  `admin_route` varchar(75) NOT NULL,
  `public_route` varchar(75) NOT NULL,
  `handler_class` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_notice` (
  `notice_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `message` mediumtext NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `display_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `dismissible` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Notice may be hidden when read by users',
  `user_criteria` mediumblob NOT NULL,
  `page_criteria` mediumblob NOT NULL,
  `display_image` enum('','avatar','image') NOT NULL DEFAULT '',
  `image_url` varchar(200) NOT NULL DEFAULT '',
  `visibility` enum('','wide','medium','narrow') NOT NULL DEFAULT '',
  `notice_type` varchar(25) NOT NULL DEFAULT 'block',
  `display_style` varchar(25) NOT NULL DEFAULT '',
  `css_class` varchar(50) NOT NULL DEFAULT '',
  `display_duration` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delay_duration` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `auto_dismiss` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_notice_dismissed` (
  `notice_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `dismiss_date` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_oembed` (
  `oembed_id` int(10) UNSIGNED NOT NULL,
  `media_site_id` varbinary(25) NOT NULL,
  `media_id` varbinary(250) NOT NULL,
  `media_hash` varbinary(32) NOT NULL,
  `title` mediumtext DEFAULT NULL,
  `fetch_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `first_request_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_request_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pruned` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_processing` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `failed_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `fail_count` smallint(5) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_oembed_referrer` (
  `referrer_id` int(10) UNSIGNED NOT NULL,
  `oembed_id` int(10) UNSIGNED NOT NULL,
  `referrer_hash` varbinary(32) NOT NULL,
  `referrer_url` text NOT NULL,
  `hits` int(10) UNSIGNED NOT NULL,
  `first_date` int(10) UNSIGNED NOT NULL,
  `last_date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_option` (
  `option_id` varbinary(50) NOT NULL,
  `option_value` mediumblob NOT NULL,
  `default_value` mediumblob NOT NULL,
  `edit_format` enum('textbox','spinbox','onoff','radio','select','checkbox','template','callback','onofftextbox','username') NOT NULL,
  `edit_format_params` mediumtext NOT NULL,
  `data_type` enum('string','integer','numeric','array','boolean','positive_integer','unsigned_integer','unsigned_numeric') NOT NULL,
  `sub_options` mediumtext NOT NULL,
  `validation_class` varchar(100) NOT NULL,
  `validation_method` varchar(75) NOT NULL,
  `advanced` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `addon_id` varbinary(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_option_group` (
  `group_id` varbinary(50) NOT NULL,
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT 'Optional icon',
  `display_order` int(10) UNSIGNED NOT NULL,
  `debug_only` tinyint(3) UNSIGNED NOT NULL,
  `advanced` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `addon_id` varbinary(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_option_group_relation` (
  `option_id` varbinary(50) NOT NULL,
  `group_id` varbinary(50) NOT NULL,
  `display_order` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_page` (
  `node_id` int(10) UNSIGNED NOT NULL,
  `publish_date` int(10) UNSIGNED NOT NULL,
  `modified_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `view_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `log_visits` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `list_siblings` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `list_children` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `callback_class` varchar(100) NOT NULL DEFAULT '',
  `callback_method` varchar(75) NOT NULL DEFAULT '',
  `advanced_mode` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_payment_profile` (
  `payment_profile_id` int(10) UNSIGNED NOT NULL,
  `provider_id` varbinary(25) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `display_title` varchar(100) NOT NULL DEFAULT '',
  `options` blob DEFAULT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_payment_provider` (
  `provider_id` varbinary(25) NOT NULL,
  `provider_class` varchar(100) NOT NULL,
  `addon_id` varbinary(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_payment_provider_log` (
  `provider_log_id` int(10) UNSIGNED NOT NULL,
  `purchase_request_key` varbinary(32) DEFAULT NULL,
  `provider_id` varbinary(25) NOT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `subscriber_id` varchar(100) DEFAULT NULL,
  `log_type` enum('payment','cancel','info','error') NOT NULL,
  `log_message` varchar(255) NOT NULL DEFAULT '',
  `log_details` mediumblob NOT NULL,
  `log_date` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_permission` (
  `permission_id` varbinary(25) NOT NULL,
  `permission_group_id` varbinary(25) NOT NULL,
  `permission_type` enum('flag','integer') NOT NULL,
  `interface_group_id` varbinary(50) NOT NULL,
  `depend_permission_id` varbinary(25) NOT NULL,
  `display_order` int(10) UNSIGNED NOT NULL,
  `addon_id` varbinary(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_permission_cache_content` (
  `permission_combination_id` int(10) UNSIGNED NOT NULL,
  `content_type` varbinary(25) NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `cache_value` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_permission_combination` (
  `permission_combination_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_group_list` mediumblob NOT NULL,
  `cache_value` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_permission_combination_user_group` (
  `user_group_id` int(10) UNSIGNED NOT NULL,
  `permission_combination_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_permission_entry` (
  `permission_entry_id` int(10) UNSIGNED NOT NULL,
  `user_group_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `permission_group_id` varbinary(25) NOT NULL,
  `permission_id` varbinary(25) NOT NULL,
  `permission_value` enum('unset','allow','deny','use_int') NOT NULL,
  `permission_value_int` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_permission_entry_content` (
  `permission_entry_id` int(10) UNSIGNED NOT NULL,
  `content_type` varbinary(25) NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `user_group_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `permission_group_id` varbinary(25) NOT NULL,
  `permission_id` varbinary(25) NOT NULL,
  `permission_value` enum('unset','reset','content_allow','deny','use_int') NOT NULL,
  `permission_value_int` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_permission_interface_group` (
  `interface_group_id` varbinary(50) NOT NULL,
  `display_order` int(10) UNSIGNED NOT NULL,
  `is_moderator` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `addon_id` varbinary(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_phrase` (
  `phrase_id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `title` varbinary(100) NOT NULL,
  `phrase_text` mediumtext NOT NULL,
  `global_cache` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `addon_id` varbinary(50) NOT NULL DEFAULT '',
  `version_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `version_string` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_phrase_compiled` (
  `language_id` int(10) UNSIGNED NOT NULL,
  `title` varbinary(100) NOT NULL,
  `phrase_text` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_phrase_map` (
  `phrase_map_id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `title` varbinary(100) NOT NULL,
  `phrase_id` int(10) UNSIGNED NOT NULL,
  `phrase_group` varbinary(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_poll` (
  `poll_id` int(10) UNSIGNED NOT NULL,
  `content_type` varbinary(25) NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `question` varchar(100) NOT NULL,
  `responses` mediumblob NOT NULL,
  `voter_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `public_votes` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `max_votes` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `close_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `change_vote` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `view_results_unvoted` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_poll_response` (
  `poll_response_id` int(10) UNSIGNED NOT NULL,
  `poll_id` int(10) UNSIGNED NOT NULL,
  `response` varchar(100) NOT NULL,
  `response_vote_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `voters` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_poll_vote` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `poll_response_id` int(10) UNSIGNED NOT NULL,
  `poll_id` int(10) UNSIGNED NOT NULL,
  `vote_date` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_post` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `post_date` int(10) UNSIGNED NOT NULL,
  `message` mediumtext NOT NULL,
  `ip_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message_state` enum('visible','moderated','deleted') NOT NULL DEFAULT 'visible',
  `attach_count` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `position` int(10) UNSIGNED NOT NULL,
  `type_data` mediumblob NOT NULL,
  `reaction_score` int(11) NOT NULL DEFAULT 0,
  `reactions` blob DEFAULT NULL,
  `reaction_users` blob NOT NULL,
  `vote_score` int(11) NOT NULL,
  `vote_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `warning_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `warning_message` varchar(255) NOT NULL DEFAULT '',
  `last_edit_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_edit_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `edit_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `embed_metadata` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_pre_reg_action` (
  `action_id` int(10) UNSIGNED NOT NULL,
  `guest_key` varbinary(75) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL DEFAULT '',
  `last_update` int(10) UNSIGNED NOT NULL,
  `action_class` varchar(100) NOT NULL,
  `action_data` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_profile_post` (
  `profile_post_id` int(10) UNSIGNED NOT NULL,
  `profile_user_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `post_date` int(10) UNSIGNED NOT NULL,
  `message` mediumtext NOT NULL,
  `ip_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message_state` enum('visible','moderated','deleted') NOT NULL DEFAULT 'visible',
  `attach_count` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `reaction_score` int(11) NOT NULL DEFAULT 0,
  `reactions` blob DEFAULT NULL,
  `reaction_users` blob NOT NULL,
  `comment_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `first_comment_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_comment_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `latest_comment_ids` blob NOT NULL,
  `warning_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `warning_message` varchar(255) NOT NULL DEFAULT '',
  `embed_metadata` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_profile_post_comment` (
  `profile_post_comment_id` int(10) UNSIGNED NOT NULL,
  `profile_post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `comment_date` int(10) UNSIGNED NOT NULL,
  `message` mediumtext NOT NULL,
  `ip_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message_state` enum('visible','moderated','deleted') NOT NULL DEFAULT 'visible',
  `attach_count` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `reaction_score` int(11) NOT NULL DEFAULT 0,
  `reactions` blob DEFAULT NULL,
  `reaction_users` blob NOT NULL,
  `warning_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `warning_message` varchar(255) NOT NULL DEFAULT '',
  `embed_metadata` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_purchasable` (
  `purchasable_type_id` varchar(50) NOT NULL,
  `purchasable_class` varchar(100) NOT NULL,
  `addon_id` varbinary(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_purchase_request` (
  `purchase_request_id` int(10) UNSIGNED NOT NULL,
  `request_key` varbinary(32) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `provider_id` varbinary(25) NOT NULL,
  `payment_profile_id` int(10) UNSIGNED NOT NULL,
  `purchasable_type_id` varchar(50) NOT NULL,
  `cost_amount` decimal(10,2) UNSIGNED NOT NULL,
  `cost_currency` varchar(3) NOT NULL,
  `extra_data` blob DEFAULT NULL,
  `provider_metadata` varbinary(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_reaction` (
  `reaction_id` int(10) UNSIGNED NOT NULL,
  `text_color` varchar(100) NOT NULL,
  `image_url` varchar(200) NOT NULL,
  `image_url_2x` varchar(200) NOT NULL DEFAULT '',
  `sprite_mode` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `sprite_params` blob NOT NULL,
  `reaction_score` int(11) NOT NULL DEFAULT 1,
  `display_order` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_reaction_content` (
  `reaction_content_id` int(10) UNSIGNED NOT NULL,
  `reaction_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `content_type` varbinary(25) NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `reaction_user_id` int(10) UNSIGNED NOT NULL,
  `reaction_date` int(10) UNSIGNED NOT NULL,
  `content_user_id` int(10) UNSIGNED NOT NULL,
  `is_counted` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_registration_spam_cache` (
  `cache_key` varbinary(128) NOT NULL DEFAULT '',
  `result` mediumblob NOT NULL,
  `timeout` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_report` (
  `report_id` int(10) UNSIGNED NOT NULL,
  `content_type` varbinary(25) NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `content_user_id` int(10) UNSIGNED NOT NULL,
  `content_info` mediumblob NOT NULL,
  `first_report_date` int(10) UNSIGNED NOT NULL,
  `report_state` enum('open','assigned','resolved','rejected') NOT NULL,
  `assigned_user_id` int(10) UNSIGNED NOT NULL,
  `comment_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_modified_date` int(10) UNSIGNED NOT NULL,
  `last_modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_modified_username` varchar(50) NOT NULL DEFAULT '',
  `report_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_report_comment` (
  `report_comment_id` int(10) UNSIGNED NOT NULL,
  `report_id` int(10) UNSIGNED NOT NULL,
  `comment_date` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `message` mediumtext NOT NULL,
  `state_change` enum('','open','assigned','resolved','rejected') NOT NULL DEFAULT '',
  `is_report` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_route` (
  `route_id` int(10) UNSIGNED NOT NULL,
  `route_type` varbinary(25) NOT NULL,
  `route_prefix` varbinary(50) NOT NULL,
  `sub_name` varbinary(50) NOT NULL,
  `format` varchar(255) NOT NULL DEFAULT '',
  `build_class` varchar(100) NOT NULL DEFAULT '',
  `build_method` varbinary(75) NOT NULL DEFAULT '',
  `controller` varbinary(255) NOT NULL,
  `context` varbinary(255) NOT NULL DEFAULT '',
  `action_prefix` varbinary(255) NOT NULL DEFAULT '',
  `addon_id` varbinary(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_route_filter` (
  `route_filter_id` int(10) UNSIGNED NOT NULL,
  `prefix` varchar(25) NOT NULL,
  `find_route` varchar(255) NOT NULL,
  `replace_route` varchar(255) NOT NULL,
  `enabled` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `url_to_route_only` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_search` (
  `search_id` int(10) UNSIGNED NOT NULL,
  `search_results` mediumblob NOT NULL,
  `result_count` smallint(5) UNSIGNED NOT NULL,
  `search_type` varchar(25) NOT NULL,
  `search_query` varchar(200) NOT NULL,
  `search_constraints` mediumblob NOT NULL,
  `search_order` varchar(50) NOT NULL,
  `search_grouping` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `user_results` mediumblob NOT NULL,
  `warnings` mediumblob NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `search_date` int(10) UNSIGNED NOT NULL,
  `query_hash` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_search_forum` (
  `node_id` int(10) UNSIGNED NOT NULL,
  `search_criteria` mediumblob NOT NULL,
  `sort_order` varchar(25) NOT NULL DEFAULT 'last_post_date',
  `sort_direction` varchar(5) NOT NULL DEFAULT 'desc',
  `max_results` smallint(5) UNSIGNED NOT NULL DEFAULT 200,
  `cache_ttl` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `discussion_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_post_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_post_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_post_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_post_username` varchar(50) NOT NULL DEFAULT '',
  `last_thread_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_thread_title` varchar(150) NOT NULL DEFAULT '',
  `last_thread_prefix_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_search_forum_cache` (
  `node_id` int(10) UNSIGNED NOT NULL,
  `results` mediumblob NOT NULL,
  `cache_date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_search_forum_cache_user` (
  `node_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `results` mediumblob NOT NULL,
  `cache_date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_search_index` (
  `content_type` varchar(25) NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(250) NOT NULL DEFAULT '',
  `message` mediumtext NOT NULL,
  `metadata` mediumtext NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `item_date` int(10) UNSIGNED NOT NULL,
  `discussion_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_session` (
  `session_id` varbinary(32) NOT NULL,
  `session_data` mediumblob NOT NULL,
  `expiry_date` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_session_activity` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `unique_key` varbinary(16) NOT NULL,
  `ip` varbinary(16) NOT NULL DEFAULT '',
  `controller_name` varchar(100) NOT NULL,
  `controller_action` varchar(75) NOT NULL,
  `view_state` enum('valid','error') NOT NULL,
  `params` varbinary(100) NOT NULL,
  `view_date` int(10) UNSIGNED NOT NULL,
  `robot_key` varbinary(25) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_session_admin` (
  `session_id` varbinary(32) NOT NULL,
  `session_data` mediumblob NOT NULL,
  `expiry_date` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_session_install` (
  `session_id` varbinary(32) NOT NULL,
  `session_data` mediumblob NOT NULL,
  `expiry_date` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_sitemap` (
  `sitemap_id` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(3) UNSIGNED NOT NULL,
  `file_count` smallint(5) UNSIGNED NOT NULL,
  `entry_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_compressed` tinyint(3) UNSIGNED NOT NULL,
  `complete_date` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_smilie` (
  `smilie_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `smilie_text` text NOT NULL,
  `image_url` varchar(200) NOT NULL,
  `image_url_2x` varchar(200) NOT NULL DEFAULT '',
  `sprite_mode` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `sprite_params` blob NOT NULL,
  `smilie_category_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `display_order` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `display_in_editor` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_smilie_category` (
  `smilie_category_id` int(10) UNSIGNED NOT NULL,
  `display_order` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_spam_cleaner_log` (
  `spam_cleaner_log_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `username` varchar(50) NOT NULL DEFAULT '',
  `applying_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `applying_username` varchar(50) NOT NULL DEFAULT '',
  `application_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` mediumblob NOT NULL COMMENT 'Serialized array containing log data for undo purposes',
  `restored_date` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_spam_trigger_log` (
  `trigger_log_id` int(10) UNSIGNED NOT NULL,
  `content_type` varbinary(25) NOT NULL,
  `content_id` int(10) UNSIGNED DEFAULT NULL,
  `log_date` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `result` varbinary(25) NOT NULL,
  `details` mediumblob NOT NULL,
  `request_state` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_stats_daily` (
  `stats_date` int(10) UNSIGNED NOT NULL,
  `stats_type` varbinary(50) NOT NULL,
  `counter` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_style` (
  `style_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL,
  `parent_list` varbinary(100) NOT NULL COMMENT 'IDs of ancestor styles in order, eg: this,parent,grandparent,root',
  `title` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL DEFAULT '',
  `properties` mediumblob NOT NULL COMMENT 'Serialized array of materialized style properties for this style',
  `assets` mediumblob NOT NULL,
  `effective_assets` mediumblob NOT NULL,
  `last_modified_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_selectable` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Unselectable styles are unselectable by non-admin visitors',
  `designer_mode` varbinary(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_style_property` (
  `property_id` int(10) UNSIGNED NOT NULL,
  `property_name` varbinary(50) NOT NULL,
  `style_id` int(10) UNSIGNED NOT NULL,
  `group_name` varbinary(50) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `property_type` varchar(25) NOT NULL,
  `css_components` blob NOT NULL,
  `value_type` varchar(25) NOT NULL DEFAULT '',
  `value_parameters` text NOT NULL,
  `depends_on` varbinary(50) NOT NULL DEFAULT '',
  `value_group` varbinary(50) NOT NULL DEFAULT '',
  `property_value` mediumblob NOT NULL,
  `display_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `addon_id` varbinary(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_style_property_group` (
  `property_group_id` int(10) UNSIGNED NOT NULL,
  `group_name` varbinary(50) NOT NULL,
  `style_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `display_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `addon_id` varbinary(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_style_property_map` (
  `property_map_id` int(10) UNSIGNED NOT NULL,
  `style_id` int(10) UNSIGNED NOT NULL,
  `property_name` varbinary(50) NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `parent_property_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_tag` (
  `tag_id` int(10) UNSIGNED NOT NULL,
  `tag` varchar(100) NOT NULL,
  `tag_url` varchar(100) NOT NULL,
  `use_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_use_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `permanent` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_tag_content` (
  `tag_content_id` int(10) UNSIGNED NOT NULL,
  `content_type` varbinary(25) NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `add_user_id` int(10) UNSIGNED NOT NULL,
  `add_date` int(10) UNSIGNED NOT NULL,
  `visible` tinyint(3) UNSIGNED NOT NULL,
  `content_date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_tag_result_cache` (
  `result_cache_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `cache_date` int(10) UNSIGNED NOT NULL,
  `expiry_date` int(10) UNSIGNED NOT NULL,
  `results` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_template` (
  `template_id` int(10) UNSIGNED NOT NULL,
  `type` varbinary(20) NOT NULL,
  `title` varbinary(100) NOT NULL,
  `style_id` int(10) UNSIGNED NOT NULL,
  `template` mediumtext NOT NULL COMMENT 'User-editable HTML and template syntax',
  `template_parsed` mediumblob NOT NULL,
  `addon_id` varbinary(50) NOT NULL DEFAULT '',
  `version_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `version_string` varchar(30) NOT NULL DEFAULT '',
  `last_edit_date` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_template_history` (
  `template_history_id` int(10) UNSIGNED NOT NULL,
  `type` varbinary(20) NOT NULL,
  `title` varbinary(100) NOT NULL,
  `style_id` int(10) UNSIGNED NOT NULL,
  `template` mediumtext NOT NULL,
  `edit_date` int(10) UNSIGNED NOT NULL,
  `log_date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_template_map` (
  `template_map_id` int(10) UNSIGNED NOT NULL,
  `style_id` int(10) UNSIGNED NOT NULL,
  `type` varbinary(20) NOT NULL,
  `title` varbinary(100) NOT NULL,
  `template_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_template_modification` (
  `modification_id` int(10) UNSIGNED NOT NULL,
  `addon_id` varbinary(50) NOT NULL,
  `type` varbinary(20) NOT NULL,
  `template` varbinary(100) NOT NULL,
  `modification_key` varbinary(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `execution_order` int(10) UNSIGNED NOT NULL,
  `enabled` tinyint(3) UNSIGNED NOT NULL,
  `action` varchar(25) NOT NULL,
  `find` text NOT NULL,
  `replace` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_template_modification_log` (
  `template_id` int(10) UNSIGNED NOT NULL,
  `modification_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(25) NOT NULL,
  `apply_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_template_phrase` (
  `template_id` int(10) UNSIGNED NOT NULL,
  `phrase_title` varbinary(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_tfa_attempt` (
  `attempt_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `attempt_date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_tfa_provider` (
  `provider_id` varbinary(25) NOT NULL,
  `provider_class` varchar(100) NOT NULL,
  `priority` smallint(5) UNSIGNED NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL,
  `options` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_thread` (
  `thread_id` int(10) UNSIGNED NOT NULL,
  `node_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `reply_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `view_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `post_date` int(10) UNSIGNED NOT NULL,
  `sticky` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `discussion_state` enum('visible','moderated','deleted') NOT NULL DEFAULT 'visible',
  `discussion_open` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `discussion_type` varchar(50) NOT NULL DEFAULT '',
  `type_data` mediumblob NOT NULL,
  `first_post_id` int(10) UNSIGNED NOT NULL,
  `first_post_reaction_score` int(11) NOT NULL DEFAULT 0,
  `first_post_reactions` blob DEFAULT NULL,
  `last_post_date` int(10) UNSIGNED NOT NULL,
  `last_post_id` int(10) UNSIGNED NOT NULL,
  `last_post_user_id` int(10) UNSIGNED NOT NULL,
  `last_post_username` varchar(50) NOT NULL,
  `prefix_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tags` mediumblob NOT NULL,
  `custom_fields` mediumblob NOT NULL,
  `vote_score` int(11) NOT NULL,
  `vote_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_thread_field` (
  `field_id` varbinary(25) NOT NULL,
  `display_group` varbinary(25) NOT NULL DEFAULT 'before',
  `display_order` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `field_type` varbinary(25) NOT NULL DEFAULT 'textbox',
  `field_choices` blob NOT NULL,
  `match_type` varbinary(25) NOT NULL DEFAULT 'none',
  `match_params` blob NOT NULL,
  `max_length` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `required` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `display_template` text NOT NULL,
  `wrapper_template` text NOT NULL,
  `editable_user_group_ids` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_thread_field_value` (
  `thread_id` int(10) UNSIGNED NOT NULL,
  `field_id` varbinary(25) NOT NULL,
  `field_value` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_thread_prefix` (
  `prefix_id` int(10) UNSIGNED NOT NULL,
  `prefix_group_id` int(10) UNSIGNED NOT NULL,
  `display_order` int(10) UNSIGNED NOT NULL,
  `materialized_order` int(10) UNSIGNED NOT NULL COMMENT 'Internally-set order, based on prefix_group.display_order, prefix.display_order',
  `css_class` varchar(50) NOT NULL DEFAULT '',
  `allowed_user_group_ids` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_thread_prefix_group` (
  `prefix_group_id` int(10) UNSIGNED NOT NULL,
  `display_order` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_thread_prompt` (
  `prompt_id` int(10) UNSIGNED NOT NULL,
  `prompt_group_id` int(10) UNSIGNED NOT NULL,
  `display_order` int(10) UNSIGNED NOT NULL,
  `materialized_order` int(10) UNSIGNED NOT NULL COMMENT 'Internally-set order, based on prompt_group.display_order, prompt.display_order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_thread_prompt_group` (
  `prompt_group_id` int(10) UNSIGNED NOT NULL,
  `display_order` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_thread_question` (
  `thread_id` int(10) UNSIGNED NOT NULL,
  `solution_post_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `solution_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_thread_read` (
  `thread_read_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(10) UNSIGNED NOT NULL,
  `thread_read_date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_thread_redirect` (
  `thread_id` int(10) UNSIGNED NOT NULL,
  `target_url` text NOT NULL,
  `redirect_key` varchar(50) NOT NULL DEFAULT '',
  `expiry_date` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_thread_reply_ban` (
  `thread_reply_ban_id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ban_date` int(10) UNSIGNED NOT NULL,
  `expiry_date` int(10) UNSIGNED DEFAULT NULL,
  `reason` varchar(100) NOT NULL DEFAULT '',
  `ban_user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_thread_type` (
  `thread_type_id` varbinary(50) NOT NULL,
  `handler_class` varchar(100) NOT NULL,
  `addon_id` varbinary(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_thread_user_post` (
  `thread_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `post_count` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_thread_view` (
  `thread_id` int(10) UNSIGNED NOT NULL,
  `total` int(10) UNSIGNED NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_thread_watch` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(10) UNSIGNED NOT NULL,
  `email_subscribe` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_trophy` (
  `trophy_id` int(10) UNSIGNED NOT NULL,
  `trophy_points` int(10) UNSIGNED NOT NULL,
  `user_criteria` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_unfurl_result` (
  `result_id` int(10) UNSIGNED NOT NULL,
  `url` text NOT NULL,
  `url_hash` varbinary(32) NOT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `favicon_url` text DEFAULT NULL,
  `last_request_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pending` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `error_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_upgrade_check` (
  `check_id` int(10) UNSIGNED NOT NULL,
  `error_code` varchar(50) DEFAULT NULL,
  `check_date` int(10) UNSIGNED DEFAULT NULL,
  `board_url_valid` tinyint(3) UNSIGNED DEFAULT NULL,
  `branding_valid` tinyint(3) UNSIGNED DEFAULT NULL,
  `license_expired` tinyint(3) UNSIGNED DEFAULT NULL,
  `last_agreement_date` int(10) UNSIGNED DEFAULT NULL,
  `last_agreement_update` int(10) UNSIGNED DEFAULT NULL,
  `invalid_add_ons` blob DEFAULT NULL,
  `installable_add_ons` blob DEFAULT NULL,
  `available_updates` blob DEFAULT NULL,
  `response_data` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_upgrade_job` (
  `unique_key` varbinary(50) NOT NULL,
  `execute_class` varchar(100) NOT NULL,
  `execute_data` mediumblob NOT NULL,
  `immediate` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_upgrade_log` (
  `version_id` int(10) UNSIGNED NOT NULL,
  `last_step` smallint(5) UNSIGNED DEFAULT NULL,
  `completion_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `log_type` enum('install','upgrade') NOT NULL DEFAULT 'upgrade'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `username_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `username_date_visible` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `email` varchar(120) NOT NULL,
  `custom_title` varchar(50) NOT NULL DEFAULT '',
  `language_id` int(10) UNSIGNED NOT NULL,
  `style_id` int(10) UNSIGNED NOT NULL COMMENT '0 = use system default',
  `timezone` varchar(50) NOT NULL COMMENT 'Example: ''Europe/London''',
  `visible` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Show browsing activity to others',
  `activity_visible` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `user_group_id` int(10) UNSIGNED NOT NULL,
  `secondary_group_ids` varbinary(255) NOT NULL,
  `display_style_group_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'User group ID that provides user styling',
  `permission_combination_id` int(10) UNSIGNED NOT NULL,
  `message_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `question_solution_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `conversations_unread` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `register_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_summary_email_date` int(10) UNSIGNED DEFAULT NULL,
  `trophy_points` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `alerts_unviewed` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `alerts_unread` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `avatar_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `avatar_width` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `avatar_height` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `avatar_highdpi` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `gravatar` varchar(120) NOT NULL DEFAULT '' COMMENT 'If specified, this is an email address corresponding to the user''s ''Gravatar''',
  `user_state` enum('valid','email_confirm','email_confirm_edit','moderated','email_bounce','rejected','disabled') NOT NULL DEFAULT 'valid',
  `security_lock` enum('','change','reset') NOT NULL DEFAULT '',
  `is_moderator` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `is_admin` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `is_banned` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `reaction_score` int(11) NOT NULL DEFAULT 0,
  `vote_score` int(11) NOT NULL DEFAULT 0,
  `warning_points` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_staff` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `secret_key` varbinary(32) NOT NULL,
  `privacy_policy_accepted` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `terms_accepted` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_username_change` (
  `change_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `old_username` varchar(50) NOT NULL,
  `new_username` varchar(50) NOT NULL,
  `change_reason` varchar(200) NOT NULL DEFAULT '',
  `change_state` enum('moderated','approved','rejected') NOT NULL DEFAULT 'approved',
  `change_user_id` int(10) UNSIGNED NOT NULL,
  `change_date` int(10) UNSIGNED NOT NULL,
  `moderator_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `reject_reason` varchar(200) NOT NULL DEFAULT '',
  `visible` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_alert` (
  `alert_id` int(10) UNSIGNED NOT NULL,
  `alerted_user_id` int(10) UNSIGNED NOT NULL COMMENT 'User being alerted',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'User who did the action that caused the alert',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT 'Corresponds to user_id',
  `content_type` varbinary(25) NOT NULL COMMENT 'eg: trophy',
  `content_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `action` varbinary(30) NOT NULL COMMENT 'eg: edit',
  `event_date` int(10) UNSIGNED NOT NULL,
  `view_date` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Time when this was viewed by the alerted user',
  `read_date` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Time when this was read by the alerted user',
  `auto_read` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `extra_data` mediumblob NOT NULL COMMENT 'Serialized. Stores any extra data relevant to the alert',
  `depends_on_addon_id` varbinary(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_alert_optout` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `alert` varbinary(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_authenticate` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `scheme_class` varchar(100) NOT NULL,
  `data` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_ban` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `ban_user_id` int(10) UNSIGNED NOT NULL,
  `ban_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `end_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_reason` varchar(255) NOT NULL,
  `triggered` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_change_temp` (
  `user_change_temp_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `change_key` varbinary(50) DEFAULT NULL,
  `action_type` varbinary(50) NOT NULL,
  `action_modifier` varbinary(255) DEFAULT NULL,
  `new_value` mediumblob DEFAULT NULL,
  `old_value` mediumblob DEFAULT NULL,
  `create_date` int(10) UNSIGNED DEFAULT NULL,
  `expiry_date` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_confirmation` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `confirmation_type` varchar(25) NOT NULL,
  `confirmation_key` varchar(16) NOT NULL,
  `confirmation_date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_connected_account` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varbinary(25) NOT NULL,
  `provider_key` varbinary(150) NOT NULL,
  `extra_data` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_field` (
  `field_id` varbinary(25) NOT NULL,
  `display_group` enum('personal','contact','preferences') NOT NULL DEFAULT 'personal',
  `display_order` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `field_type` varbinary(25) NOT NULL DEFAULT 'textbox',
  `field_choices` blob NOT NULL,
  `match_type` varbinary(25) NOT NULL DEFAULT 'none',
  `match_params` blob NOT NULL,
  `max_length` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `required` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `show_registration` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `user_editable` enum('yes','once','never') NOT NULL DEFAULT 'yes',
  `viewable_profile` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `viewable_message` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `display_template` text NOT NULL,
  `wrapper_template` text NOT NULL,
  `moderator_editable` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_field_value` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `field_id` varbinary(25) NOT NULL,
  `field_value` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_follow` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `follow_user_id` int(10) UNSIGNED NOT NULL COMMENT 'User being followed',
  `follow_date` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_group` (
  `user_group_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `display_style_priority` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `username_css` text NOT NULL,
  `user_title` varchar(100) NOT NULL DEFAULT '',
  `banner_css_class` varchar(75) NOT NULL DEFAULT '',
  `banner_text` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_group_change` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `change_key` varbinary(50) NOT NULL,
  `group_ids` varbinary(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_group_promotion` (
  `promotion_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `user_criteria` mediumblob NOT NULL,
  `extra_user_group_ids` varbinary(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_group_promotion_log` (
  `promotion_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `promotion_date` int(10) UNSIGNED NOT NULL,
  `promotion_state` enum('automatic','manual','disabled') NOT NULL DEFAULT 'automatic'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_group_relation` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_group_id` int(10) UNSIGNED NOT NULL,
  `is_primary` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_ignored` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `ignored_user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_option` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `show_dob_year` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Show date of month year (thus: age)',
  `show_dob_date` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Show date of birth day and month',
  `content_show_signature` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Show user''s signatures with content',
  `receive_admin_email` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `email_on_conversation` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Receive an email upon receiving a conversation message',
  `push_on_conversation` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `is_discouraged` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'If non-zero, this user will be subjected to annoying random system failures.',
  `creation_watch_state` enum('','watch_no_email','watch_email') NOT NULL DEFAULT '',
  `interaction_watch_state` enum('','watch_no_email','watch_email') NOT NULL DEFAULT '',
  `alert_optout` text NOT NULL COMMENT 'Comma-separated list of alerts from which the user has opted out. Example: ''post_like,user_trophy''',
  `push_optout` text NOT NULL COMMENT 'Comma-separated list of alerts from which the user has opted out for push notifications. Example: ''post_like,user_trophy''',
  `use_tfa` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_privacy` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `allow_view_profile` enum('everyone','members','followed','none') NOT NULL DEFAULT 'everyone',
  `allow_post_profile` enum('members','followed','none') NOT NULL DEFAULT 'members',
  `allow_send_personal_conversation` enum('members','followed','none') NOT NULL DEFAULT 'members',
  `allow_view_identities` enum('everyone','members','followed','none') NOT NULL DEFAULT 'everyone',
  `allow_receive_news_feed` enum('everyone','members','followed','none') NOT NULL DEFAULT 'everyone'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_profile` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `dob_day` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `dob_month` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `dob_year` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `signature` text NOT NULL,
  `website` text NOT NULL,
  `location` varchar(50) NOT NULL DEFAULT '',
  `following` text NOT NULL COMMENT 'Comma-separated integers from xf_user_follow',
  `ignored` text NOT NULL COMMENT 'Comma-separated integers from xf_user_ignored',
  `avatar_crop_x` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'X-Position from which to start the square crop on the m avatar',
  `avatar_crop_y` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Y-Position from which to start the square crop on the m avatar',
  `banner_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `banner_position_y` tinyint(3) UNSIGNED DEFAULT NULL,
  `about` text NOT NULL,
  `custom_fields` mediumblob NOT NULL,
  `connected_accounts` mediumblob NOT NULL,
  `password_date` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_push_optout` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `push` varbinary(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_push_subscription` (
  `endpoint_id` int(10) UNSIGNED NOT NULL,
  `endpoint_hash` varbinary(32) NOT NULL,
  `endpoint` text NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `data` mediumblob DEFAULT NULL,
  `last_seen` int(10) UNSIGNED NOT NULL,
  `error_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_reject` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `reject_date` int(10) UNSIGNED NOT NULL,
  `reject_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `reject_reason` varchar(200) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_remember` (
  `remember_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `remember_key` varbinary(32) NOT NULL,
  `start_date` int(10) UNSIGNED NOT NULL,
  `expiry_date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_tfa` (
  `user_tfa_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider_id` varbinary(25) NOT NULL,
  `provider_data` mediumblob NOT NULL,
  `last_used_date` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_tfa_trusted` (
  `tfa_trusted_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `trusted_key` varbinary(32) NOT NULL,
  `trusted_until` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_title_ladder` (
  `minimum_level` int(10) UNSIGNED NOT NULL,
  `title` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_trophy` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `trophy_id` int(10) UNSIGNED NOT NULL,
  `award_date` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_upgrade` (
  `user_upgrade_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `display_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `extra_group_ids` varbinary(255) NOT NULL DEFAULT '',
  `recurring` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `cost_amount` decimal(10,2) UNSIGNED NOT NULL,
  `cost_currency` varchar(3) NOT NULL,
  `length_amount` tinyint(3) UNSIGNED NOT NULL,
  `length_unit` enum('day','month','year','') NOT NULL DEFAULT '',
  `disabled_upgrade_ids` varbinary(255) NOT NULL DEFAULT '',
  `can_purchase` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `payment_profile_ids` varbinary(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_upgrade_active` (
  `user_upgrade_record_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `purchase_request_key` varbinary(32) DEFAULT NULL,
  `user_upgrade_id` int(10) UNSIGNED NOT NULL,
  `extra` mediumblob NOT NULL,
  `start_date` int(10) UNSIGNED NOT NULL,
  `end_date` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_user_upgrade_expired` (
  `user_upgrade_record_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `purchase_request_key` varbinary(32) DEFAULT NULL,
  `user_upgrade_id` int(10) UNSIGNED NOT NULL,
  `extra` mediumblob NOT NULL,
  `start_date` int(10) UNSIGNED NOT NULL,
  `end_date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `original_end_date` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_warning` (
  `warning_id` int(10) UNSIGNED NOT NULL,
  `content_type` varbinary(25) NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `content_title` varchar(255) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `warning_date` int(10) UNSIGNED NOT NULL,
  `warning_user_id` int(10) UNSIGNED NOT NULL,
  `warning_definition_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  `points` smallint(5) UNSIGNED NOT NULL,
  `expiry_date` int(10) UNSIGNED NOT NULL,
  `is_expired` tinyint(3) UNSIGNED NOT NULL,
  `extra_user_group_ids` varbinary(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_warning_action` (
  `warning_action_id` int(10) UNSIGNED NOT NULL,
  `points` smallint(5) UNSIGNED NOT NULL,
  `action` varbinary(25) NOT NULL,
  `action_length_type` varbinary(25) NOT NULL,
  `action_length` smallint(5) UNSIGNED NOT NULL,
  `extra_user_group_ids` varbinary(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_warning_action_trigger` (
  `action_trigger_id` int(10) UNSIGNED NOT NULL,
  `warning_action_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `trigger_points` smallint(5) UNSIGNED NOT NULL,
  `action_date` int(10) UNSIGNED NOT NULL,
  `action` varbinary(25) NOT NULL,
  `min_unban_date` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_warning_definition` (
  `warning_definition_id` int(10) UNSIGNED NOT NULL,
  `points_default` smallint(5) UNSIGNED NOT NULL,
  `expiry_type` enum('never','days','weeks','months','years') NOT NULL,
  `expiry_default` smallint(5) UNSIGNED NOT NULL,
  `extra_user_group_ids` varbinary(255) NOT NULL,
  `is_editable` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_widget` (
  `widget_id` int(10) UNSIGNED NOT NULL,
  `widget_key` varbinary(50) NOT NULL,
  `definition_id` varbinary(25) NOT NULL,
  `positions` blob NOT NULL,
  `options` blob NOT NULL,
  `display_condition` mediumtext NOT NULL,
  `condition_expression` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_widget_definition` (
  `definition_id` varbinary(25) NOT NULL,
  `definition_class` varchar(100) NOT NULL,
  `addon_id` varbinary(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `xf_widget_position` (
  `position_id` varbinary(50) NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL,
  `addon_id` varbinary(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE `xf_activity_summary_definition`
  ADD PRIMARY KEY (`definition_id`);

ALTER TABLE `xf_activity_summary_section`
  ADD PRIMARY KEY (`section_id`);

ALTER TABLE `xf_addon`
  ADD PRIMARY KEY (`addon_id`),
  ADD KEY `title` (`title`);

ALTER TABLE `xf_addon_install_batch`
  ADD PRIMARY KEY (`batch_id`);

ALTER TABLE `xf_admin`
  ADD PRIMARY KEY (`user_id`);

ALTER TABLE `xf_admin_log`
  ADD PRIMARY KEY (`admin_log_id`),
  ADD KEY `request_date` (`request_date`),
  ADD KEY `user_id_request_date` (`user_id`,`request_date`);

ALTER TABLE `xf_admin_navigation`
  ADD PRIMARY KEY (`navigation_id`),
  ADD KEY `parent_navigation_id_display_order` (`parent_navigation_id`,`display_order`);

ALTER TABLE `xf_admin_permission`
  ADD PRIMARY KEY (`admin_permission_id`),
  ADD KEY `display_order` (`display_order`);

ALTER TABLE `xf_admin_permission_entry`
  ADD PRIMARY KEY (`user_id`,`admin_permission_id`);

ALTER TABLE `xf_advertising`
  ADD PRIMARY KEY (`ad_id`);

ALTER TABLE `xf_advertising_position`
  ADD PRIMARY KEY (`position_id`);

ALTER TABLE `xf_api_attachment_key`
  ADD PRIMARY KEY (`attachment_key`),
  ADD KEY `create_date` (`create_date`);

ALTER TABLE `xf_api_key`
  ADD PRIMARY KEY (`api_key_id`),
  ADD UNIQUE KEY `api_key_hash` (`api_key_hash`);

ALTER TABLE `xf_api_key_scope`
  ADD PRIMARY KEY (`api_key_id`,`api_scope_id`);

ALTER TABLE `xf_api_login_token`
  ADD PRIMARY KEY (`login_token_id`),
  ADD UNIQUE KEY `login_token` (`login_token`),
  ADD KEY `expiry_date` (`expiry_date`);

ALTER TABLE `xf_api_scope`
  ADD PRIMARY KEY (`api_scope_id`);

ALTER TABLE `xf_approval_queue`
  ADD PRIMARY KEY (`content_type`,`content_id`),
  ADD KEY `content_date` (`content_date`);

ALTER TABLE `xf_attachment`
  ADD PRIMARY KEY (`attachment_id`),
  ADD KEY `content_type_id_date` (`content_type`,`content_id`,`attach_date`),
  ADD KEY `temp_hash_attach_date` (`temp_hash`,`attach_date`),
  ADD KEY `unassociated_attach_date` (`unassociated`,`attach_date`),
  ADD KEY `data_id` (`data_id`),
  ADD KEY `attach_date` (`attach_date`);

ALTER TABLE `xf_attachment_data`
  ADD PRIMARY KEY (`data_id`),
  ADD KEY `user_id_upload_date` (`user_id`,`upload_date`),
  ADD KEY `attach_count` (`attach_count`),
  ADD KEY `upload_date` (`upload_date`),
  ADD KEY `file_size` (`file_size`);

ALTER TABLE `xf_attachment_view`
  ADD PRIMARY KEY (`attachment_id`);

ALTER TABLE `xf_ban_email`
  ADD PRIMARY KEY (`banned_email`),
  ADD KEY `create_date` (`create_date`);

ALTER TABLE `xf_bb_code`
  ADD PRIMARY KEY (`bb_code_id`);

ALTER TABLE `xf_bb_code_media_site`
  ADD PRIMARY KEY (`media_site_id`);

ALTER TABLE `xf_bookmark_item`
  ADD PRIMARY KEY (`bookmark_id`),
  ADD UNIQUE KEY `user_id_content_type_content_id` (`user_id`,`content_type`,`content_id`),
  ADD KEY `content_type_content_id` (`content_type`,`content_id`);

ALTER TABLE `xf_bookmark_label`
  ADD PRIMARY KEY (`label_id`),
  ADD UNIQUE KEY `label_user_id` (`label`,`user_id`),
  ADD UNIQUE KEY `label_url_user_id` (`label_url`,`user_id`),
  ADD KEY `use_count` (`use_count`);

ALTER TABLE `xf_bookmark_label_use`
  ADD PRIMARY KEY (`label_id`,`bookmark_id`);

ALTER TABLE `xf_captcha_log`
  ADD PRIMARY KEY (`hash`),
  ADD KEY `captcha_date` (`captcha_date`);

ALTER TABLE `xf_captcha_question`
  ADD PRIMARY KEY (`captcha_question_id`),
  ADD KEY `active` (`active`);

ALTER TABLE `xf_category`
  ADD PRIMARY KEY (`node_id`);

ALTER TABLE `xf_change_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `content_type_content_id_date` (`content_type`,`content_id`,`edit_date`),
  ADD KEY `content_type_date` (`content_type`,`edit_date`),
  ADD KEY `edit_date` (`edit_date`);

ALTER TABLE `xf_class_extension`
  ADD PRIMARY KEY (`extension_id`),
  ADD UNIQUE KEY `from_class` (`from_class`,`to_class`);

ALTER TABLE `xf_code_event`
  ADD PRIMARY KEY (`event_id`);

ALTER TABLE `xf_code_event_listener`
  ADD PRIMARY KEY (`event_listener_id`),
  ADD KEY `event_id_execute_order` (`event_id`,`execute_order`),
  ADD KEY `addon_id_event_id` (`addon_id`,`event_id`);

ALTER TABLE `xf_connected_account_provider`
  ADD PRIMARY KEY (`provider_id`);

ALTER TABLE `xf_content_spam_cache`
  ADD PRIMARY KEY (`spam_cache_id`),
  ADD UNIQUE KEY `content_type` (`content_type`,`content_id`),
  ADD KEY `insert_date` (`insert_date`);

ALTER TABLE `xf_content_type_field`
  ADD PRIMARY KEY (`content_type`,`field_name`),
  ADD KEY `field_name` (`field_name`);

ALTER TABLE `xf_content_vote`
  ADD PRIMARY KEY (`vote_id`),
  ADD UNIQUE KEY `content_type_id_user` (`content_type`,`content_id`,`vote_user_id`),
  ADD KEY `vote_user_id` (`vote_user_id`),
  ADD KEY `content_user_id` (`content_user_id`);

ALTER TABLE `xf_conversation_master`
  ADD PRIMARY KEY (`conversation_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `last_message_user_id` (`last_message_user_id`);

ALTER TABLE `xf_conversation_message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `conversation_id_message_date` (`conversation_id`,`message_date`),
  ADD KEY `message_date` (`message_date`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `xf_conversation_recipient`
  ADD PRIMARY KEY (`conversation_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `xf_conversation_user`
  ADD PRIMARY KEY (`conversation_id`,`owner_user_id`),
  ADD KEY `last_message_user_id` (`last_message_user_id`),
  ADD KEY `owner_user_id_last_message_date` (`owner_user_id`,`last_message_date`),
  ADD KEY `owner_user_id_is_unread` (`owner_user_id`,`is_unread`),
  ADD KEY `owner_starred_date` (`owner_user_id`,`is_starred`,`last_message_date`);

ALTER TABLE `xf_cookie_consent_log`
  ADD PRIMARY KEY (`cookie_consent_log_id`),
  ADD KEY `log_date` (`log_date`),
  ADD KEY `user_id_log_date` (`user_id`,`log_date`),
  ADD KEY `ip_address_log_date` (`ip_address`,`log_date`);

ALTER TABLE `xf_cron_entry`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `active_next_run` (`active`,`next_run`);

ALTER TABLE `xf_css_cache`
  ADD PRIMARY KEY (`cache_id`),
  ADD UNIQUE KEY `style_language_title_modifier` (`style_id`,`language_id`,`title`,`modifier_key`);

ALTER TABLE `xf_data_registry`
  ADD PRIMARY KEY (`data_key`);

ALTER TABLE `xf_deletion_log`
  ADD PRIMARY KEY (`content_type`,`content_id`),
  ADD KEY `delete_user_id_date` (`delete_user_id`,`delete_date`);

ALTER TABLE `xf_draft`
  ADD PRIMARY KEY (`draft_id`),
  ADD UNIQUE KEY `draft_key_user` (`draft_key`,`user_id`),
  ADD KEY `last_update` (`last_update`);

ALTER TABLE `xf_editor_dropdown`
  ADD PRIMARY KEY (`cmd`);

ALTER TABLE `xf_edit_history`
  ADD PRIMARY KEY (`edit_history_id`),
  ADD KEY `content_type` (`content_type`,`content_id`,`edit_date`),
  ADD KEY `edit_date` (`edit_date`),
  ADD KEY `edit_user_id` (`edit_user_id`);

ALTER TABLE `xf_email_bounce_log`
  ADD PRIMARY KEY (`bounce_id`),
  ADD KEY `log_date` (`log_date`);

ALTER TABLE `xf_email_bounce_soft`
  ADD PRIMARY KEY (`bounce_soft_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`bounce_date`),
  ADD KEY `bounce_date` (`bounce_date`);

ALTER TABLE `xf_error_log`
  ADD PRIMARY KEY (`error_id`),
  ADD KEY `exception_date` (`exception_date`);

ALTER TABLE `xf_feed`
  ADD PRIMARY KEY (`feed_id`),
  ADD KEY `active` (`active`);

ALTER TABLE `xf_feed_log`
  ADD PRIMARY KEY (`feed_id`,`unique_id`);

ALTER TABLE `xf_file_check`
  ADD PRIMARY KEY (`check_id`);

ALTER TABLE `xf_find_new`
  ADD PRIMARY KEY (`find_new_id`),
  ADD KEY `cache_date` (`cache_date`),
  ADD KEY `type_user_date` (`content_type`,`user_id`,`cache_date`);

ALTER TABLE `xf_find_new_default`
  ADD PRIMARY KEY (`find_new_default_id`),
  ADD UNIQUE KEY `user_content` (`user_id`,`content_type`);

ALTER TABLE `xf_flood_check`
  ADD PRIMARY KEY (`user_id`,`flood_action`),
  ADD KEY `flood_time` (`flood_time`);

ALTER TABLE `xf_forum`
  ADD PRIMARY KEY (`node_id`);

ALTER TABLE `xf_forum_field`
  ADD PRIMARY KEY (`node_id`,`field_id`),
  ADD KEY `field_id` (`field_id`);

ALTER TABLE `xf_forum_prefix`
  ADD PRIMARY KEY (`node_id`,`prefix_id`),
  ADD KEY `prefix_id` (`prefix_id`);

ALTER TABLE `xf_forum_prompt`
  ADD PRIMARY KEY (`node_id`,`prompt_id`);

ALTER TABLE `xf_forum_read`
  ADD PRIMARY KEY (`forum_read_id`),
  ADD UNIQUE KEY `user_id_node_id` (`user_id`,`node_id`),
  ADD KEY `node_id` (`node_id`),
  ADD KEY `forum_read_date` (`forum_read_date`);

ALTER TABLE `xf_forum_type`
  ADD PRIMARY KEY (`forum_type_id`);

ALTER TABLE `xf_forum_watch`
  ADD PRIMARY KEY (`user_id`,`node_id`),
  ADD KEY `node_id_notify_on` (`node_id`,`notify_on`);

ALTER TABLE `xf_help_page`
  ADD PRIMARY KEY (`page_id`),
  ADD UNIQUE KEY `page_name` (`page_name`),
  ADD KEY `display_order` (`display_order`);

ALTER TABLE `xf_image_proxy`
  ADD PRIMARY KEY (`image_id`),
  ADD UNIQUE KEY `url_hash` (`url_hash`),
  ADD KEY `pruned_fetch_date` (`pruned`,`fetch_date`),
  ADD KEY `last_request_date` (`last_request_date`),
  ADD KEY `is_processing` (`is_processing`);

ALTER TABLE `xf_image_proxy_referrer`
  ADD PRIMARY KEY (`referrer_id`),
  ADD UNIQUE KEY `image_id_hash` (`image_id`,`referrer_hash`),
  ADD KEY `last_date` (`last_date`);

ALTER TABLE `xf_ip`
  ADD PRIMARY KEY (`ip_id`),
  ADD KEY `user_id_log_date` (`user_id`,`log_date`),
  ADD KEY `ip_log_date` (`ip`,`log_date`),
  ADD KEY `content_type_content_id` (`content_type`,`content_id`),
  ADD KEY `log_date` (`log_date`),
  ADD KEY `user_id_ip_log_date` (`user_id`,`ip`,`log_date`);

ALTER TABLE `xf_ip_match`
  ADD PRIMARY KEY (`ip`,`match_type`),
  ADD KEY `start_range` (`start_range`),
  ADD KEY `create_date` (`create_date`);

ALTER TABLE `xf_job`
  ADD PRIMARY KEY (`job_id`),
  ADD UNIQUE KEY `unique_key` (`unique_key`),
  ADD KEY `trigger_date` (`trigger_date`),
  ADD KEY `manual_execute_date` (`manual_execute`,`trigger_date`);

ALTER TABLE `xf_json_convert_error`
  ADD PRIMARY KEY (`error_id`),
  ADD UNIQUE KEY `table_column_pk` (`table_name`,`column_name`,`pk_id`);

ALTER TABLE `xf_language`
  ADD PRIMARY KEY (`language_id`);

ALTER TABLE `xf_link_forum`
  ADD PRIMARY KEY (`node_id`);

ALTER TABLE `xf_link_proxy`
  ADD PRIMARY KEY (`link_id`),
  ADD UNIQUE KEY `url_hash` (`url_hash`),
  ADD KEY `last_request_date` (`last_request_date`);

ALTER TABLE `xf_link_proxy_referrer`
  ADD PRIMARY KEY (`referrer_id`),
  ADD UNIQUE KEY `link_id_hash` (`link_id`,`referrer_hash`),
  ADD KEY `last_date` (`last_date`);

ALTER TABLE `xf_login_attempt`
  ADD PRIMARY KEY (`attempt_id`),
  ADD KEY `login_check` (`login`,`ip_address`,`attempt_date`),
  ADD KEY `attempt_date` (`attempt_date`),
  ADD KEY `ip_address_attempt_date` (`ip_address`,`attempt_date`);

ALTER TABLE `xf_mail_queue`
  ADD PRIMARY KEY (`mail_queue_id`),
  ADD KEY `send_date_queue_date` (`send_date`,`queue_date`);

ALTER TABLE `xf_member_stat`
  ADD PRIMARY KEY (`member_stat_id`),
  ADD UNIQUE KEY `member_stat_key` (`member_stat_key`),
  ADD KEY `display_order` (`display_order`);

ALTER TABLE `xf_moderator`
  ADD PRIMARY KEY (`user_id`);

ALTER TABLE `xf_moderator_content`
  ADD PRIMARY KEY (`moderator_id`),
  ADD UNIQUE KEY `content_user_id` (`content_type`,`content_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `xf_moderator_log`
  ADD PRIMARY KEY (`moderator_log_id`),
  ADD KEY `log_date` (`log_date`),
  ADD KEY `content_user_id` (`content_user_id`),
  ADD KEY `content_type_id` (`content_type`,`content_id`),
  ADD KEY `discussion_content_type_id` (`discussion_content_type`,`discussion_content_id`),
  ADD KEY `user_id_log_date` (`user_id`,`log_date`);

ALTER TABLE `xf_navigation`
  ADD PRIMARY KEY (`navigation_id`),
  ADD KEY `parent_navigation_id_display_order` (`parent_navigation_id`,`display_order`);

ALTER TABLE `xf_navigation_type`
  ADD PRIMARY KEY (`navigation_type_id`);

ALTER TABLE `xf_news_feed`
  ADD PRIMARY KEY (`news_feed_id`),
  ADD KEY `userId_eventDate` (`user_id`,`event_date`),
  ADD KEY `contentType_contentId` (`content_type`,`content_id`),
  ADD KEY `event_date` (`event_date`);

ALTER TABLE `xf_node`
  ADD PRIMARY KEY (`node_id`),
  ADD UNIQUE KEY `node_name_unique` (`node_name`,`node_type_id`),
  ADD KEY `parent_node_id` (`parent_node_id`),
  ADD KEY `display_order` (`display_order`),
  ADD KEY `display_in_list` (`display_in_list`,`lft`),
  ADD KEY `lft` (`lft`);

ALTER TABLE `xf_node_type`
  ADD PRIMARY KEY (`node_type_id`);

ALTER TABLE `xf_notice`
  ADD PRIMARY KEY (`notice_id`);

ALTER TABLE `xf_notice_dismissed`
  ADD PRIMARY KEY (`notice_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `xf_oembed`
  ADD PRIMARY KEY (`oembed_id`),
  ADD UNIQUE KEY `media_hash` (`media_hash`),
  ADD KEY `pruned_fetch_date` (`pruned`,`fetch_date`),
  ADD KEY `last_request_date` (`last_request_date`),
  ADD KEY `is_processing` (`is_processing`);

ALTER TABLE `xf_oembed_referrer`
  ADD PRIMARY KEY (`referrer_id`),
  ADD UNIQUE KEY `oembed_id_hash` (`oembed_id`,`referrer_hash`),
  ADD KEY `last_date` (`last_date`);

ALTER TABLE `xf_option`
  ADD PRIMARY KEY (`option_id`);

ALTER TABLE `xf_option_group`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `display_order` (`display_order`);

ALTER TABLE `xf_option_group_relation`
  ADD PRIMARY KEY (`option_id`,`group_id`),
  ADD KEY `group_id_display_order` (`group_id`,`display_order`);

ALTER TABLE `xf_page`
  ADD PRIMARY KEY (`node_id`);

ALTER TABLE `xf_payment_profile`
  ADD PRIMARY KEY (`payment_profile_id`);

ALTER TABLE `xf_payment_provider`
  ADD PRIMARY KEY (`provider_id`);

ALTER TABLE `xf_payment_provider_log`
  ADD PRIMARY KEY (`provider_log_id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `subscriber_id` (`subscriber_id`),
  ADD KEY `log_date` (`log_date`);

ALTER TABLE `xf_permission`
  ADD PRIMARY KEY (`permission_id`,`permission_group_id`),
  ADD KEY `display_order` (`display_order`);

ALTER TABLE `xf_permission_cache_content`
  ADD PRIMARY KEY (`permission_combination_id`,`content_type`,`content_id`);

ALTER TABLE `xf_permission_combination`
  ADD PRIMARY KEY (`permission_combination_id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `xf_permission_combination_user_group`
  ADD PRIMARY KEY (`user_group_id`,`permission_combination_id`),
  ADD KEY `permission_combination_id` (`permission_combination_id`);

ALTER TABLE `xf_permission_entry`
  ADD PRIMARY KEY (`permission_entry_id`),
  ADD UNIQUE KEY `unique_permission` (`user_group_id`,`user_id`,`permission_group_id`,`permission_id`);

ALTER TABLE `xf_permission_entry_content`
  ADD PRIMARY KEY (`permission_entry_id`),
  ADD UNIQUE KEY `user_group_id_unique` (`user_group_id`,`user_id`,`content_type`,`content_id`,`permission_group_id`,`permission_id`),
  ADD KEY `content_type_content_id` (`content_type`,`content_id`);

ALTER TABLE `xf_permission_interface_group`
  ADD PRIMARY KEY (`interface_group_id`),
  ADD KEY `display_order` (`display_order`);

ALTER TABLE `xf_phrase`
  ADD PRIMARY KEY (`phrase_id`),
  ADD UNIQUE KEY `title` (`title`,`language_id`),
  ADD KEY `language_id_global_cache` (`language_id`,`global_cache`);

ALTER TABLE `xf_phrase_compiled`
  ADD PRIMARY KEY (`language_id`,`title`);

ALTER TABLE `xf_phrase_map`
  ADD PRIMARY KEY (`phrase_map_id`),
  ADD UNIQUE KEY `language_id_title` (`language_id`,`title`),
  ADD KEY `title` (`title`),
  ADD KEY `phrase_id` (`phrase_id`),
  ADD KEY `group_language` (`phrase_group`,`language_id`);

ALTER TABLE `xf_poll`
  ADD PRIMARY KEY (`poll_id`),
  ADD UNIQUE KEY `content_type_content_id` (`content_type`,`content_id`);

ALTER TABLE `xf_poll_response`
  ADD PRIMARY KEY (`poll_response_id`),
  ADD KEY `poll_id_response_id` (`poll_id`,`poll_response_id`);

ALTER TABLE `xf_poll_vote`
  ADD PRIMARY KEY (`poll_response_id`,`user_id`),
  ADD KEY `poll_id_user_id` (`poll_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `xf_post`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `thread_id_post_date` (`thread_id`,`post_date`),
  ADD KEY `thread_id_position` (`thread_id`,`position`),
  ADD KEY `thread_id_score_date` (`thread_id`,`vote_score`,`post_date`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_date` (`post_date`);

ALTER TABLE `xf_pre_reg_action`
  ADD PRIMARY KEY (`action_id`),
  ADD UNIQUE KEY `guest_key` (`guest_key`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `last_update` (`last_update`);

ALTER TABLE `xf_profile_post`
  ADD PRIMARY KEY (`profile_post_id`),
  ADD KEY `profile_user_id_post_date` (`profile_user_id`,`post_date`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_date` (`post_date`);

ALTER TABLE `xf_profile_post_comment`
  ADD PRIMARY KEY (`profile_post_comment_id`),
  ADD KEY `profile_post_id_comment_date` (`profile_post_id`,`comment_date`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `comment_date` (`comment_date`);

ALTER TABLE `xf_purchasable`
  ADD PRIMARY KEY (`purchasable_type_id`);

ALTER TABLE `xf_purchase_request`
  ADD PRIMARY KEY (`purchase_request_id`),
  ADD UNIQUE KEY `request_key` (`request_key`),
  ADD KEY `provider_id_metadata` (`provider_id`,`provider_metadata`);

ALTER TABLE `xf_reaction`
  ADD PRIMARY KEY (`reaction_id`),
  ADD KEY `display_order` (`display_order`);

ALTER TABLE `xf_reaction_content`
  ADD PRIMARY KEY (`reaction_content_id`),
  ADD UNIQUE KEY `content_type_id_user_id` (`content_type`,`content_id`,`reaction_user_id`),
  ADD KEY `content_type_id_reaction_date` (`content_type`,`content_id`,`reaction_date`),
  ADD KEY `content_user_id_reaction_date` (`content_user_id`,`reaction_date`),
  ADD KEY `content_user_id_is_counted_reaction_id_reaction_date` (`content_user_id`,`is_counted`,`reaction_id`,`reaction_date`),
  ADD KEY `reaction_date` (`reaction_date`),
  ADD KEY `reaction_user_id` (`reaction_user_id`);

ALTER TABLE `xf_registration_spam_cache`
  ADD PRIMARY KEY (`cache_key`),
  ADD KEY `timeout` (`timeout`);

ALTER TABLE `xf_report`
  ADD PRIMARY KEY (`report_id`),
  ADD UNIQUE KEY `content_type_content_id` (`content_type`,`content_id`),
  ADD KEY `report_state` (`report_state`),
  ADD KEY `assigned_user_id_state` (`assigned_user_id`,`report_state`),
  ADD KEY `last_modified_date` (`last_modified_date`),
  ADD KEY `last_modified_user_id` (`last_modified_user_id`),
  ADD KEY `content_user_id_modified` (`content_user_id`,`last_modified_date`);

ALTER TABLE `xf_report_comment`
  ADD PRIMARY KEY (`report_comment_id`),
  ADD KEY `report_id_date` (`report_id`,`comment_date`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `xf_route`
  ADD PRIMARY KEY (`route_id`),
  ADD UNIQUE KEY `route_type` (`route_type`,`route_prefix`,`sub_name`);

ALTER TABLE `xf_route_filter`
  ADD PRIMARY KEY (`route_filter_id`),
  ADD KEY `route_type_prefix` (`prefix`);

ALTER TABLE `xf_search`
  ADD PRIMARY KEY (`search_id`),
  ADD KEY `search_date` (`search_date`),
  ADD KEY `query_hash` (`query_hash`);

ALTER TABLE `xf_search_forum`
  ADD PRIMARY KEY (`node_id`);

ALTER TABLE `xf_search_forum_cache`
  ADD PRIMARY KEY (`node_id`);

ALTER TABLE `xf_search_forum_cache_user`
  ADD PRIMARY KEY (`node_id`,`user_id`);

ALTER TABLE `xf_search_index`
  ADD PRIMARY KEY (`content_type`,`content_id`),
  ADD KEY `user_id_item_date` (`user_id`,`item_date`);
ALTER TABLE `xf_search_index` ADD FULLTEXT KEY `title_message_metadata` (`title`,`message`,`metadata`);
ALTER TABLE `xf_search_index` ADD FULLTEXT KEY `title_metadata` (`title`,`metadata`);

ALTER TABLE `xf_session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `expiry_date` (`expiry_date`);

ALTER TABLE `xf_session_activity`
  ADD PRIMARY KEY (`user_id`,`unique_key`),
  ADD KEY `view_date` (`view_date`) USING BTREE;

ALTER TABLE `xf_session_admin`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `expiry_date` (`expiry_date`);

ALTER TABLE `xf_session_install`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `expiry_date` (`expiry_date`);

ALTER TABLE `xf_sitemap`
  ADD PRIMARY KEY (`sitemap_id`),
  ADD KEY `is_active` (`is_active`);

ALTER TABLE `xf_smilie`
  ADD PRIMARY KEY (`smilie_id`),
  ADD KEY `display_order` (`display_order`);

ALTER TABLE `xf_smilie_category`
  ADD PRIMARY KEY (`smilie_category_id`);

ALTER TABLE `xf_spam_cleaner_log`
  ADD PRIMARY KEY (`spam_cleaner_log_id`),
  ADD KEY `application_date` (`application_date`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `applying_user_id` (`applying_user_id`);

ALTER TABLE `xf_spam_trigger_log`
  ADD PRIMARY KEY (`trigger_log_id`),
  ADD UNIQUE KEY `content_type` (`content_type`,`content_id`),
  ADD KEY `log_date` (`log_date`);

ALTER TABLE `xf_stats_daily`
  ADD PRIMARY KEY (`stats_date`,`stats_type`);

ALTER TABLE `xf_style`
  ADD PRIMARY KEY (`style_id`),
  ADD UNIQUE KEY `designer_mode` (`designer_mode`);

ALTER TABLE `xf_style_property`
  ADD PRIMARY KEY (`property_id`),
  ADD UNIQUE KEY `style_id_property_name` (`style_id`,`property_name`);

ALTER TABLE `xf_style_property_group`
  ADD PRIMARY KEY (`property_group_id`),
  ADD UNIQUE KEY `group_name_style_id` (`group_name`,`style_id`);

ALTER TABLE `xf_style_property_map`
  ADD PRIMARY KEY (`property_map_id`),
  ADD UNIQUE KEY `style_id` (`style_id`,`property_name`),
  ADD KEY `parent_property_id` (`parent_property_id`);

ALTER TABLE `xf_tag`
  ADD PRIMARY KEY (`tag_id`),
  ADD UNIQUE KEY `tag` (`tag`),
  ADD UNIQUE KEY `tag_url` (`tag_url`),
  ADD KEY `use_count` (`use_count`);

ALTER TABLE `xf_tag_content`
  ADD PRIMARY KEY (`tag_content_id`),
  ADD UNIQUE KEY `content_type_id_tag` (`content_type`,`content_id`,`tag_id`),
  ADD KEY `tag_id_content_date` (`tag_id`,`content_date`);

ALTER TABLE `xf_tag_result_cache`
  ADD PRIMARY KEY (`result_cache_id`),
  ADD UNIQUE KEY `tag_id_user_id` (`tag_id`,`user_id`),
  ADD KEY `expiration_date` (`expiry_date`);

ALTER TABLE `xf_template`
  ADD PRIMARY KEY (`template_id`),
  ADD UNIQUE KEY `type_title_style_id` (`type`,`title`,`style_id`);

ALTER TABLE `xf_template_history`
  ADD PRIMARY KEY (`template_history_id`),
  ADD KEY `log_date` (`log_date`),
  ADD KEY `type_title_style_id` (`type`,`title`,`style_id`),
  ADD KEY `title` (`title`);

ALTER TABLE `xf_template_map`
  ADD PRIMARY KEY (`template_map_id`),
  ADD UNIQUE KEY `style_id_type_title` (`style_id`,`type`,`title`),
  ADD KEY `template_id` (`template_id`),
  ADD KEY `type_title` (`type`,`title`);

ALTER TABLE `xf_template_modification`
  ADD PRIMARY KEY (`modification_id`),
  ADD UNIQUE KEY `modification_key` (`modification_key`),
  ADD KEY `addon_id` (`addon_id`),
  ADD KEY `template_order` (`template`,`execution_order`);

ALTER TABLE `xf_template_modification_log`
  ADD PRIMARY KEY (`template_id`,`modification_id`),
  ADD KEY `modification_id` (`modification_id`);

ALTER TABLE `xf_template_phrase`
  ADD PRIMARY KEY (`template_id`,`phrase_title`),
  ADD KEY `phrase_title` (`phrase_title`);

ALTER TABLE `xf_tfa_attempt`
  ADD PRIMARY KEY (`attempt_id`),
  ADD KEY `attempt_date` (`attempt_date`),
  ADD KEY `user_id_attempt_date` (`user_id`,`attempt_date`);

ALTER TABLE `xf_tfa_provider`
  ADD PRIMARY KEY (`provider_id`);

ALTER TABLE `xf_thread`
  ADD PRIMARY KEY (`thread_id`),
  ADD KEY `node_id_last_post_date` (`node_id`,`last_post_date`),
  ADD KEY `node_id_sticky_state_last_post` (`node_id`,`sticky`,`discussion_state`,`last_post_date`),
  ADD KEY `node_id_sticky_state_vote_score` (`node_id`,`sticky`,`discussion_state`,`vote_score`),
  ADD KEY `last_post_date` (`last_post_date`),
  ADD KEY `last_post_user_id` (`last_post_user_id`),
  ADD KEY `post_date` (`post_date`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `xf_thread_field`
  ADD PRIMARY KEY (`field_id`),
  ADD KEY `display_group_order` (`display_group`,`display_order`);

ALTER TABLE `xf_thread_field_value`
  ADD PRIMARY KEY (`thread_id`,`field_id`),
  ADD KEY `field_id` (`field_id`);

ALTER TABLE `xf_thread_prefix`
  ADD PRIMARY KEY (`prefix_id`),
  ADD KEY `materialized_order` (`materialized_order`);

ALTER TABLE `xf_thread_prefix_group`
  ADD PRIMARY KEY (`prefix_group_id`);

ALTER TABLE `xf_thread_prompt`
  ADD PRIMARY KEY (`prompt_id`),
  ADD KEY `materialized_order` (`materialized_order`);

ALTER TABLE `xf_thread_prompt_group`
  ADD PRIMARY KEY (`prompt_group_id`);

ALTER TABLE `xf_thread_question`
  ADD PRIMARY KEY (`thread_id`);

ALTER TABLE `xf_thread_read`
  ADD PRIMARY KEY (`thread_read_id`),
  ADD UNIQUE KEY `user_id_thread_id` (`user_id`,`thread_id`),
  ADD KEY `thread_id` (`thread_id`),
  ADD KEY `thread_read_date` (`thread_read_date`);

ALTER TABLE `xf_thread_redirect`
  ADD PRIMARY KEY (`thread_id`),
  ADD KEY `redirect_key_expiry_date` (`redirect_key`,`expiry_date`);

ALTER TABLE `xf_thread_reply_ban`
  ADD PRIMARY KEY (`thread_reply_ban_id`),
  ADD UNIQUE KEY `thread_id` (`thread_id`,`user_id`),
  ADD KEY `expiry_date` (`expiry_date`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `xf_thread_type`
  ADD PRIMARY KEY (`thread_type_id`);

ALTER TABLE `xf_thread_user_post`
  ADD PRIMARY KEY (`thread_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `xf_thread_view`
  ADD PRIMARY KEY (`thread_id`);

ALTER TABLE `xf_thread_watch`
  ADD PRIMARY KEY (`user_id`,`thread_id`),
  ADD KEY `thread_id_email_subscribe` (`thread_id`,`email_subscribe`);

ALTER TABLE `xf_trophy`
  ADD PRIMARY KEY (`trophy_id`);

ALTER TABLE `xf_unfurl_result`
  ADD PRIMARY KEY (`result_id`),
  ADD UNIQUE KEY `url_hash` (`url_hash`),
  ADD KEY `last_request_date` (`last_request_date`);

ALTER TABLE `xf_upgrade_check`
  ADD PRIMARY KEY (`check_id`),
  ADD KEY `check_date` (`check_date`);

ALTER TABLE `xf_upgrade_job`
  ADD PRIMARY KEY (`unique_key`),
  ADD KEY `immediate` (`immediate`);

ALTER TABLE `xf_upgrade_log`
  ADD PRIMARY KEY (`version_id`);

ALTER TABLE `xf_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `email` (`email`),
  ADD KEY `permission_combination_id` (`permission_combination_id`),
  ADD KEY `user_state` (`user_state`),
  ADD KEY `last_activity` (`last_activity`),
  ADD KEY `last_summary_email_date` (`last_summary_email_date`),
  ADD KEY `message_count` (`message_count`),
  ADD KEY `trophy_points` (`trophy_points`),
  ADD KEY `reaction_score` (`reaction_score`),
  ADD KEY `register_date` (`register_date`),
  ADD KEY `question_solution_count` (`question_solution_count`),
  ADD KEY `vote_score` (`vote_score`),
  ADD KEY `staff_username` (`is_staff`,`username`);

ALTER TABLE `xf_username_change`
  ADD PRIMARY KEY (`change_id`),
  ADD KEY `change_date` (`change_date`),
  ADD KEY `old_username_state_date` (`old_username`,`change_state`,`change_date`),
  ADD KEY `new_username_state` (`new_username`,`change_state`),
  ADD KEY `user_id_state_date` (`user_id`,`change_state`,`change_date`);

ALTER TABLE `xf_user_alert`
  ADD PRIMARY KEY (`alert_id`),
  ADD KEY `content_type_content_id_user_id` (`content_type`,`content_id`,`user_id`),
  ADD KEY `alerted_user_id_content_type_content_id` (`alerted_user_id`,`content_type`,`content_id`),
  ADD KEY `alerted_user_id_view_date` (`alerted_user_id`,`view_date`),
  ADD KEY `alerted_user_id_read_date` (`alerted_user_id`,`read_date`),
  ADD KEY `alertedUserId_eventDate` (`alerted_user_id`,`event_date`),
  ADD KEY `viewDate_eventDate` (`view_date`,`event_date`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `xf_user_alert_optout`
  ADD PRIMARY KEY (`user_id`,`alert`);

ALTER TABLE `xf_user_authenticate`
  ADD PRIMARY KEY (`user_id`);

ALTER TABLE `xf_user_ban`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `ban_date` (`ban_date`),
  ADD KEY `end_date` (`end_date`);

ALTER TABLE `xf_user_change_temp`
  ADD PRIMARY KEY (`user_change_temp_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`change_key`),
  ADD KEY `change_key` (`change_key`),
  ADD KEY `expiry_date` (`expiry_date`);

ALTER TABLE `xf_user_confirmation`
  ADD PRIMARY KEY (`user_id`,`confirmation_type`),
  ADD KEY `confirmation_date` (`confirmation_date`);

ALTER TABLE `xf_user_connected_account`
  ADD PRIMARY KEY (`user_id`,`provider`),
  ADD UNIQUE KEY `provider` (`provider`,`provider_key`);

ALTER TABLE `xf_user_field`
  ADD PRIMARY KEY (`field_id`),
  ADD KEY `display_group_order` (`display_group`,`display_order`);

ALTER TABLE `xf_user_field_value`
  ADD PRIMARY KEY (`user_id`,`field_id`),
  ADD KEY `field_id` (`field_id`);

ALTER TABLE `xf_user_follow`
  ADD PRIMARY KEY (`user_id`,`follow_user_id`),
  ADD KEY `follow_user_id` (`follow_user_id`);

ALTER TABLE `xf_user_group`
  ADD PRIMARY KEY (`user_group_id`),
  ADD KEY `title` (`title`);

ALTER TABLE `xf_user_group_change`
  ADD PRIMARY KEY (`user_id`,`change_key`),
  ADD KEY `change_key` (`change_key`);

ALTER TABLE `xf_user_group_promotion`
  ADD PRIMARY KEY (`promotion_id`),
  ADD KEY `title` (`title`);

ALTER TABLE `xf_user_group_promotion_log`
  ADD PRIMARY KEY (`promotion_id`,`user_id`),
  ADD KEY `promotion_date` (`promotion_date`),
  ADD KEY `user_id_date` (`user_id`,`promotion_date`);

ALTER TABLE `xf_user_group_relation`
  ADD PRIMARY KEY (`user_id`,`user_group_id`),
  ADD KEY `user_group_id_is_primary` (`user_group_id`,`is_primary`);

ALTER TABLE `xf_user_ignored`
  ADD PRIMARY KEY (`user_id`,`ignored_user_id`),
  ADD KEY `ignored_user_id` (`ignored_user_id`);

ALTER TABLE `xf_user_option`
  ADD PRIMARY KEY (`user_id`);

ALTER TABLE `xf_user_privacy`
  ADD PRIMARY KEY (`user_id`);

ALTER TABLE `xf_user_profile`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `dob` (`dob_month`,`dob_day`,`dob_year`);

ALTER TABLE `xf_user_push_optout`
  ADD PRIMARY KEY (`user_id`,`push`);

ALTER TABLE `xf_user_push_subscription`
  ADD PRIMARY KEY (`endpoint_id`),
  ADD UNIQUE KEY `endpoint_hash` (`endpoint_hash`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `xf_user_reject`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `reject_date` (`reject_date`);

ALTER TABLE `xf_user_remember`
  ADD PRIMARY KEY (`remember_id`),
  ADD UNIQUE KEY `user_id_remember_key` (`user_id`,`remember_key`),
  ADD KEY `expiry_date` (`expiry_date`);

ALTER TABLE `xf_user_tfa`
  ADD PRIMARY KEY (`user_tfa_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`provider_id`);

ALTER TABLE `xf_user_tfa_trusted`
  ADD PRIMARY KEY (`tfa_trusted_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`trusted_key`),
  ADD KEY `trusted_until` (`trusted_until`);

ALTER TABLE `xf_user_title_ladder`
  ADD PRIMARY KEY (`minimum_level`);

ALTER TABLE `xf_user_trophy`
  ADD PRIMARY KEY (`trophy_id`,`user_id`),
  ADD KEY `user_id_award_date` (`user_id`,`award_date`);

ALTER TABLE `xf_user_upgrade`
  ADD PRIMARY KEY (`user_upgrade_id`),
  ADD KEY `display_order` (`display_order`);

ALTER TABLE `xf_user_upgrade_active`
  ADD PRIMARY KEY (`user_upgrade_record_id`),
  ADD UNIQUE KEY `user_id_upgrade_id` (`user_id`,`user_upgrade_id`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `purchase_request_key` (`purchase_request_key`);

ALTER TABLE `xf_user_upgrade_expired`
  ADD PRIMARY KEY (`user_upgrade_record_id`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `purchase_request_key` (`purchase_request_key`);

ALTER TABLE `xf_warning`
  ADD PRIMARY KEY (`warning_id`),
  ADD KEY `content_type_id` (`content_type`,`content_id`),
  ADD KEY `user_id_date` (`user_id`,`warning_date`),
  ADD KEY `is_expired_expiry` (`is_expired`,`expiry_date`),
  ADD KEY `warning_user_id` (`warning_user_id`);

ALTER TABLE `xf_warning_action`
  ADD PRIMARY KEY (`warning_action_id`),
  ADD KEY `points` (`points`);

ALTER TABLE `xf_warning_action_trigger`
  ADD PRIMARY KEY (`action_trigger_id`),
  ADD KEY `user_id_points` (`user_id`,`trigger_points`);

ALTER TABLE `xf_warning_definition`
  ADD PRIMARY KEY (`warning_definition_id`),
  ADD KEY `points_default` (`points_default`);

ALTER TABLE `xf_widget`
  ADD PRIMARY KEY (`widget_id`),
  ADD UNIQUE KEY `widget_key` (`widget_key`);

ALTER TABLE `xf_widget_definition`
  ADD PRIMARY KEY (`definition_id`);

ALTER TABLE `xf_widget_position`
  ADD PRIMARY KEY (`position_id`);


ALTER TABLE `xf_activity_summary_section`
  MODIFY `section_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_addon_install_batch`
  MODIFY `batch_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_admin_log`
  MODIFY `admin_log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_advertising`
  MODIFY `ad_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_api_key`
  MODIFY `api_key_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_api_login_token`
  MODIFY `login_token_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_attachment`
  MODIFY `attachment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_attachment_data`
  MODIFY `data_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_bookmark_item`
  MODIFY `bookmark_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_bookmark_label`
  MODIFY `label_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_captcha_question`
  MODIFY `captcha_question_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_change_log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_class_extension`
  MODIFY `extension_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_code_event_listener`
  MODIFY `event_listener_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_content_spam_cache`
  MODIFY `spam_cache_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_content_vote`
  MODIFY `vote_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_conversation_master`
  MODIFY `conversation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_conversation_message`
  MODIFY `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_cookie_consent_log`
  MODIFY `cookie_consent_log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_css_cache`
  MODIFY `cache_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_draft`
  MODIFY `draft_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_edit_history`
  MODIFY `edit_history_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_email_bounce_log`
  MODIFY `bounce_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_email_bounce_soft`
  MODIFY `bounce_soft_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_error_log`
  MODIFY `error_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_feed`
  MODIFY `feed_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_file_check`
  MODIFY `check_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_find_new`
  MODIFY `find_new_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_find_new_default`
  MODIFY `find_new_default_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_forum_read`
  MODIFY `forum_read_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_image_proxy`
  MODIFY `image_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_image_proxy_referrer`
  MODIFY `referrer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_ip`
  MODIFY `ip_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_job`
  MODIFY `job_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_json_convert_error`
  MODIFY `error_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_language`
  MODIFY `language_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_link_proxy`
  MODIFY `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_link_proxy_referrer`
  MODIFY `referrer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_login_attempt`
  MODIFY `attempt_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_mail_queue`
  MODIFY `mail_queue_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_member_stat`
  MODIFY `member_stat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_moderator_content`
  MODIFY `moderator_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_moderator_log`
  MODIFY `moderator_log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_news_feed`
  MODIFY `news_feed_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_node`
  MODIFY `node_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_notice`
  MODIFY `notice_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_oembed`
  MODIFY `oembed_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_oembed_referrer`
  MODIFY `referrer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_payment_profile`
  MODIFY `payment_profile_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_payment_provider_log`
  MODIFY `provider_log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_permission_combination`
  MODIFY `permission_combination_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_permission_entry`
  MODIFY `permission_entry_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_permission_entry_content`
  MODIFY `permission_entry_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_phrase`
  MODIFY `phrase_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_phrase_map`
  MODIFY `phrase_map_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_poll`
  MODIFY `poll_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_poll_response`
  MODIFY `poll_response_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_post`
  MODIFY `post_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_pre_reg_action`
  MODIFY `action_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_profile_post`
  MODIFY `profile_post_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_profile_post_comment`
  MODIFY `profile_post_comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_purchase_request`
  MODIFY `purchase_request_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_reaction`
  MODIFY `reaction_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_reaction_content`
  MODIFY `reaction_content_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_report`
  MODIFY `report_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_report_comment`
  MODIFY `report_comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_route`
  MODIFY `route_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_route_filter`
  MODIFY `route_filter_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_search`
  MODIFY `search_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_smilie`
  MODIFY `smilie_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_smilie_category`
  MODIFY `smilie_category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_spam_cleaner_log`
  MODIFY `spam_cleaner_log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_spam_trigger_log`
  MODIFY `trigger_log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_style`
  MODIFY `style_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_style_property`
  MODIFY `property_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_style_property_group`
  MODIFY `property_group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_style_property_map`
  MODIFY `property_map_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_tag`
  MODIFY `tag_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_tag_content`
  MODIFY `tag_content_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_tag_result_cache`
  MODIFY `result_cache_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_template`
  MODIFY `template_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_template_history`
  MODIFY `template_history_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_template_map`
  MODIFY `template_map_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_template_modification`
  MODIFY `modification_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_tfa_attempt`
  MODIFY `attempt_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_thread`
  MODIFY `thread_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_thread_prefix`
  MODIFY `prefix_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_thread_prefix_group`
  MODIFY `prefix_group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_thread_prompt`
  MODIFY `prompt_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_thread_prompt_group`
  MODIFY `prompt_group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_thread_read`
  MODIFY `thread_read_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_thread_reply_ban`
  MODIFY `thread_reply_ban_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_trophy`
  MODIFY `trophy_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_unfurl_result`
  MODIFY `result_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_upgrade_check`
  MODIFY `check_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_username_change`
  MODIFY `change_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_user_alert`
  MODIFY `alert_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_user_change_temp`
  MODIFY `user_change_temp_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_user_group`
  MODIFY `user_group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_user_group_promotion`
  MODIFY `promotion_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_user_push_subscription`
  MODIFY `endpoint_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_user_remember`
  MODIFY `remember_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_user_tfa`
  MODIFY `user_tfa_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_user_tfa_trusted`
  MODIFY `tfa_trusted_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_user_upgrade`
  MODIFY `user_upgrade_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_user_upgrade_active`
  MODIFY `user_upgrade_record_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_warning`
  MODIFY `warning_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_warning_action`
  MODIFY `warning_action_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_warning_action_trigger`
  MODIFY `action_trigger_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_warning_definition`
  MODIFY `warning_definition_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `xf_widget`
  MODIFY `widget_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
