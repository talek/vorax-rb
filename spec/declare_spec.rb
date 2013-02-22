# encoding: UTF-8

include Vorax
include Parser

describe 'package_spec' do

  it 'should work with a simple package' do
    text = File.open("spec/sql/muci.spc", 'rb') { |file| file.read }
    parser = Vorax::Parser::Declare.new
    parser.walk(text)

    parser.constants.should eq(Set.new(["MY_CONSTANT1", "MY_CONSTANT2"]))
    parser.exceptions.should eq(Set.new(["ex_no_data_found", "ex_custom"]))
    parser.cursors.should eq(Set.new(["my_cursor"]))
    parser.types.should eq(Set.new(["population_type"]))
    parser.variables.should eq(Set.new(["g_var1", "g_var2"]))
    parser.procedures.should eq(Set.new(["my_proc"]))
    parser.functions.should eq(Set.new(["my_func"]))
  end

  it 'should work with a big package spec' do
    text = File.open('spec/sql/dbms_stats.spc', 'rb') { |file| file.read }
    parser = Vorax::Parser::Declare.new
    parser.walk(text)
    parser.constants.should eq(Set.new(["AUTO_CASCADE", "AUTO_INVALIDATE", "AUTO_SAMPLE_SIZE", "DEFAULT_DEGREE", "AUTO_DEGREE", "DEFAULT_CASCADE", "DEFAULT_DEGREE_VALUE", "DEFAULT_ESTIMATE_PERCENT", "DEFAULT_METHOD_OPT", "DEFAULT_NO_INVALIDATE", "DEFAULT_GRANULARITY", "DEFAULT_PUBLISH", "DEFAULT_INCREMENTAL", "DEFAULT_STALE_PERCENT", "DEFAULT_AUTOSTATS_TARGET", "DEFAULT_STAT_CATEGORY", "PURGE_ALL"]))
    parser.exceptions.should eq(Set.new([]))
    parser.cursors.should eq(Set.new([]))
    parser.types.should eq(Set.new(["numarray", "datearray", "chararray", "rawarray", "fltarray", "dblarray", "StatRec", "ObjectElem", "ObjectTab", "DiffRepElem", "DiffRepTab", "CContext"]))
    parser.variables.should eq(Set.new([]))
    parser.procedures.should eq(Set.new(["prepare_column_values", "prepare_column_values_nvarchar", "prepare_column_values_rowid", "set_param", "reset_param_defaults", "reset_global_pref_defaults", "set_global_prefs", "set_table_prefs", "delete_table_prefs", "export_table_prefs", "import_table_prefs", "set_schema_prefs", "delete_schema_prefs", "export_schema_prefs", "import_schema_prefs", "set_database_prefs", "delete_database_prefs", "export_database_prefs", "import_database_prefs", "init_package", "publish_pending_stats", "export_pending_stats", "delete_pending_stats", "resume_gather_stats", "set_column_stats", "set_index_stats", "set_table_stats", "convert_raw_value", "convert_raw_value_nvarchar", "convert_raw_value_rowid", "get_column_stats", "get_index_stats", "get_table_stats", "delete_column_stats", "delete_index_stats", "delete_table_stats", "delete_schema_stats", "delete_database_stats", "create_stat_table", "drop_stat_table", "upgrade_stat_table", "export_column_stats", "export_index_stats", "export_table_stats", "export_schema_stats", "export_database_stats", "import_column_stats", "import_index_stats", "import_table_stats", "import_schema_stats", "import_database_stats", "gather_index_stats", "gather_table_stats", "gather_schema_stats", "gather_database_stats", "generate_stats", "flush_database_monitoring_info", "alter_schema_tab_monitoring", "alter_database_tab_monitoring", "gather_system_stats", "get_system_stats", "set_system_stats", "delete_system_stats", "import_system_stats", "export_system_stats", "gather_fixed_objects_stats", "delete_fixed_objects_stats", "export_fixed_objects_stats", "import_fixed_objects_stats", "gather_dictionary_stats", "delete_dictionary_stats", "export_dictionary_stats", "import_dictionary_stats", "lock_table_stats", "lock_partition_stats", "lock_schema_stats", "unlock_table_stats", "unlock_partition_stats", "unlock_schema_stats", "restore_table_stats", "restore_schema_stats", "restore_database_stats", "restore_fixed_objects_stats", "restore_dictionary_stats", "restore_system_stats", "purge_stats", "alter_stats_history_retention", "copy_table_stats", "drop_extended_stats", "merge_col_usage", "seed_col_usage", "reset_col_usage", "gather_database_stats_job_proc", "cleanup_stats_job_proc"]))
    parser.functions.should eq(Set.new(["get_param", "get_prefs", "to_cascade_type", "to_estimate_percent_type", "to_degree_type", "to_no_invalidate_type", "to_publish_type", "get_stats_history_retention", "get_stats_history_availability", "diff_table_stats_in_stattab", "diff_table_stats_in_history", "diff_table_stats_in_pending", "create_extended_stats", "show_extended_stats_name", "report_col_usage"]))
  end

  it 'should work with a SYS package spec' do
    text = File.open('spec/sql/dbms_crypto.spc', 'rb') { |file| file.read }
    parser = Vorax::Parser::Declare.new
    parser.walk(text)
    parser.constants.should eq(Set.new(["HASH_MD4", "HASH_MD5", "HASH_SH1", "HMAC_MD5", "HMAC_SH1", "ENCRYPT_DES", "ENCRYPT_3DES_2KEY", "ENCRYPT_3DES", "ENCRYPT_AES", "ENCRYPT_PBE_MD5DES", "ENCRYPT_AES128", "ENCRYPT_AES192", "ENCRYPT_AES256", "CHAIN_CBC", "CHAIN_CFB", "CHAIN_ECB", "CHAIN_OFB", "PAD_PKCS5", "PAD_NONE", "PAD_ZERO", "PAD_ORCL", "ENCRYPT_RC4", "DES_CBC_PKCS5", "DES3_CBC_PKCS5", "AES_CBC_PKCS5"]))
    parser.exceptions.should eq(Set.new(["CipherSuiteInvalid", "CipherSuiteNull", "KeyNull", "KeyBadSize", "DoubleEncryption"]))
    parser.cursors.should eq(Set.new([]))
    parser.types.should eq(Set.new([]))
    parser.variables.should eq(Set.new([]))
    parser.procedures.should eq(Set.new(["Encrypt", "Decrypt"]))
    parser.functions.should eq(Set.new(["Encrypt", "Decrypt", "Hash", "Mac", "RandomBytes", "RandomNumber", "RandomInteger"]))
  end

end
