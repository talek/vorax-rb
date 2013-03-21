# encoding: UTF-8

include Vorax
include Parser

describe 'declare' do

	it 'should parse a simple declare section' do
		text = <<STRING
		as
		  type Employees is record (
		    first_name varchar2(100),
		    last_name varchar2(100)
		  );
			emp Employees;
STRING
    parser = Vorax::Parser::Declare.new(text)
		parser.items.include?(TypeItem.new("Employees", "record", "type Employees is record (\n\t\t    first_name varchar2(100),\n\t\t    last_name varchar2(100)\n\t\t  );")).should be_true
		parser.items.include?(VariableItem.new("emp", "Employees")).should be_true
	end

  it 'should work with a simple package' do
    text = File.open("spec/sql/muci.spc", 'rb') { |file| file.read }
    parser = Vorax::Parser::Declare.new(text)
		parser.items.length.should == 12
		parser.items.include?(ConstantItem.new("MY_CONSTANT1",
																					"varchar2"
																					)).should be_true
		parser.items.include?(ConstantItem.new("MY_CONSTANT2",
																					"integer"
																					)).should be_true
		parser.items.include?(ExceptionItem.new("ex_no_data_found")).should be_true
		parser.items.include?(ExceptionItem.new("ex_custom")).should be_true
		parser.items.include?(CursorItem.new("my_cursor",
																					"cursor my_cursor is\n    select * from user_tables;")).should be_true
		parser.items.include?(TypeItem.new("population_type",
																					"table",
																					"type population_type is table of varchar2(100);",
																			)).should be_true
		parser.items.include?(VariableItem.new("g_var1",
																					"integer"
																					)).should be_true
		parser.items.include?(VariableItem.new("g_var2",
																					"varchar2"
																					)).should be_true
		parser.items.include?(VariableItem.new("g_var3",
																					"dual.dummy%type"
																					)).should be_true
		parser.items.include?(VariableItem.new("g_var4",
																					"all_objects%rowtype"
																					)).should be_true
		parser.items.include?(ProcedureItem.new("procedure my_proc(p1 integer);")).should be_true
		parser.items.include?(FunctionItem.new("function my_func(param1 varchar2, param2 boolean := true) return boolean;")).should be_true
  end

  it 'should work with a big package spec' do
    text = File.open('spec/sql/dbms_stats.spc', 'rb') { |file| file.read }
    parser = Vorax::Parser::Declare.new(text)
		parser.items.include?(TypeItem.new("numarray", "varray", "type numarray is varray(256) of number;")).should be_true
		parser.items.include?(TypeItem.new("datearray", "varray", "type datearray is varray(256) of date;")).should be_true
		parser.items.include?(TypeItem.new("chararray", "varray", "type chararray is varray(256) of varchar2(4000);")).should be_true
		parser.items.include?(TypeItem.new("rawarray",  "varray", "type rawarray is varray(256) of raw(2000);")).should be_true
		parser.items.include?(TypeItem.new("fltarray",  "varray", "type fltarray is varray(256) of binary_float;")).should be_true
		parser.items.include?(TypeItem.new("dblarray",  "varray", "type dblarray is varray(256) of binary_double;")).should be_true
		parser.items.include?(TypeItem.new("StatRec",  "record", "type StatRec is record (\r\n  epc    number,\r\n  minval raw(2000),\r\n  maxval raw(2000),\r\n  bkvals numarray,\r\n  novals numarray,\r\n  chvals chararray,\r\n  eavs   number);")).should be_true
		parser.items.include?(TypeItem.new("ObjectElem",  "record", "type ObjectElem is record (\r\n  ownname     varchar2(32),        objtype     varchar2(6),         objname     varchar2(32),        partname    varchar2(32),        subpartname varchar2(32)       );")).should be_true
		parser.items.include?(TypeItem.new("ObjectTab",  "table", "type ObjectTab is table of ObjectElem;")).should be_true
		parser.items.include?(TypeItem.new("DiffRepElem",  "record", "type DiffRepElem is record (\r\n  report     clob,                 maxdiffpct number);")).should be_true
		parser.items.include?(TypeItem.new("DiffRepTab",  "table", "type DiffRepTab is table of DiffRepElem;")).should be_true
		parser.items.include?(TypeItem.new("CContext",  "varray", "type CContext is varray(10) of varchar2(100);")).should be_true
		parser.items.include?(ConstantItem.new("AUTO_CASCADE",  "BOOLEAN")).should be_true
		parser.items.include?(ConstantItem.new("AUTO_INVALIDATE",  "BOOLEAN")).should be_true
		parser.items.include?(ConstantItem.new("AUTO_SAMPLE_SIZE",  "NUMBER")).should be_true
		parser.items.include?(ConstantItem.new("DEFAULT_DEGREE",  "NUMBER")).should be_true
		parser.items.include?(ConstantItem.new("AUTO_DEGREE",  "NUMBER")).should be_true
		parser.items.include?(ConstantItem.new("DEFAULT_CASCADE",  "BOOLEAN")).should be_true
		parser.items.include?(ConstantItem.new("DEFAULT_DEGREE_VALUE",  "NUMBER")).should be_true
		parser.items.include?(ConstantItem.new("DEFAULT_ESTIMATE_PERCENT",  "NUMBER")).should be_true
		parser.items.include?(ConstantItem.new("DEFAULT_METHOD_OPT",  "VARCHAR2")).should be_true
		parser.items.include?(ConstantItem.new("DEFAULT_NO_INVALIDATE",  "BOOLEAN")).should be_true
		parser.items.include?(ConstantItem.new("DEFAULT_GRANULARITY",  "VARCHAR2")).should be_true
		parser.items.include?(ConstantItem.new("DEFAULT_PUBLISH",  "BOOLEAN")).should be_true
		parser.items.include?(ConstantItem.new("DEFAULT_INCREMENTAL",  "BOOLEAN")).should be_true
		parser.items.include?(ConstantItem.new("DEFAULT_STALE_PERCENT",  "NUMBER")).should be_true
		parser.items.include?(ConstantItem.new("DEFAULT_AUTOSTATS_TARGET",  "VARCHAR2")).should be_true
		parser.items.include?(ConstantItem.new("DEFAULT_STAT_CATEGORY",  "VARCHAR2")).should be_true
		parser.items.include?(ConstantItem.new("PURGE_ALL",  "TIMESTAMP")).should be_true
		parser.items.include?(ProcedureItem.new("procedure prepare_column_values(\r\n        srec in out StatRec, charvals chararray);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure prepare_column_values(\r\n        srec in out StatRec, datevals datearray);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure prepare_column_values(\r\n        srec in out StatRec, numvals numarray);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure prepare_column_values(\r\n        srec in out StatRec, fltvals fltarray);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure prepare_column_values(\r\n        srec in out StatRec, dblvals dblarray);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure prepare_column_values(\r\n        srec in out StatRec, rawvals rawarray);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure prepare_column_values_nvarchar(\r\n        srec in out StatRec, nvmin nvarchar2, nvmax nvarchar2);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure prepare_column_values_rowid(\r\n        srec in out StatRec, rwmin rowid, rwmax rowid);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure set_param(\r\n    pname in varchar2,\r\n    pval  in varchar2);")).should be_true
		parser.items.include?(FunctionItem.new("function get_param(\r\n    pname   in varchar2)\r\n  return varchar2;")).should be_true
		parser.items.include?(ProcedureItem.new("procedure reset_param_defaults;")).should be_true
		parser.items.include?(ProcedureItem.new("procedure reset_global_pref_defaults;")).should be_true
		parser.items.include?(ProcedureItem.new("procedure set_global_prefs(\r\n    pname   varchar2,\r\n    pvalue  varchar2);")).should be_true
		parser.items.include?(FunctionItem.new("function get_prefs(\r\n    pname   in varchar2,\r\n    ownname in varchar2 default null,\r\n    tabname in varchar2 default null)\r\n  return varchar2;")).should be_true
		parser.items.include?(ProcedureItem.new("procedure set_table_prefs(\r\n    ownname varchar2,\r\n    tabname varchar2,\r\n    pname   varchar2,\r\n    pvalue  varchar2);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure delete_table_prefs(\r\n    ownname varchar2,\r\n    tabname varchar2,\r\n    pname   varchar2);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure export_table_prefs(\r\n    ownname varchar2,\r\n    tabname varchar2,\r\n    stattab varchar2,\r\n    statid  varchar2 default null,\r\n    statown varchar2 default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure import_table_prefs(\r\n    ownname varchar2,\r\n    tabname varchar2,\r\n    stattab varchar2,\r\n    statid  varchar2 default null,\r\n    statown varchar2 default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure set_schema_prefs(\r\n    ownname varchar2,\r\n    pname   varchar2,\r\n    pvalue  varchar2);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure delete_schema_prefs(\r\n    ownname varchar2,\r\n    pname   varchar2);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure export_schema_prefs(\r\n    ownname varchar2,\r\n    stattab varchar2,\r\n    statid  varchar2 default null,\r\n    statown varchar2 default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure import_schema_prefs(\r\n    ownname varchar2,\r\n    stattab varchar2,\r\n    statid  varchar2 default null,\r\n    statown varchar2 default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure set_database_prefs(\r\n    pname   varchar2,\r\n    pvalue  varchar2,\r\n    add_sys boolean default false);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure delete_database_prefs(\r\n    pname   varchar2,\r\n    add_sys boolean default false);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure export_database_prefs(\r\n    stattab varchar2,\r\n    statid  varchar2 default null,\r\n    statown varchar2 default null,\r\n    add_sys boolean  default false);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure import_database_prefs(\r\n    stattab varchar2,\r\n    statid  varchar2 default null,\r\n    statown varchar2 default null,\r\n    add_sys boolean  default false);")).should be_true
		parser.items.include?(FunctionItem.new("function to_cascade_type(cascade varchar2) return boolean;")).should be_true
		parser.items.include?(FunctionItem.new("function to_estimate_percent_type(estimate_percent varchar2) return number;")).should be_true
		parser.items.include?(FunctionItem.new("function to_degree_type(degree varchar2) return number;")).should be_true
		parser.items.include?(FunctionItem.new("function to_no_invalidate_type(no_invalidate varchar2) return boolean;")).should be_true
		parser.items.include?(FunctionItem.new("function to_publish_type(publish varchar2) return boolean;")).should be_true
		parser.items.include?(ProcedureItem.new("procedure init_package;")).should be_true
		parser.items.include?(ProcedureItem.new("procedure publish_pending_stats(\r\n    ownname varchar2 default USER,\r\n    tabname varchar2,\r\n    no_invalidate boolean default\r\n      to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n    force   boolean default FALSE);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure export_pending_stats(\r\n    ownname varchar2 default USER,\r\n    tabname varchar2,\r\n    stattab varchar2,\r\n    statid  varchar2 default null,\r\n    statown varchar2 default USER);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure delete_pending_stats(\r\n    ownname varchar2 default USER,\r\n    tabname varchar2 default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure resume_gather_stats;")).should be_true
		parser.items.include?(ProcedureItem.new("procedure set_column_stats(\r\n        ownname varchar2, tabname varchar2, colname varchar2,\r\n        partname varchar2 default null,\r\n        stattab varchar2 default null, statid varchar2 default null,\r\n        distcnt number default null, density number default null,\r\n        nullcnt number default null, srec StatRec default null,\r\n        avgclen number default null, flags number default null,\r\n        statown varchar2 default null,\r\n        no_invalidate boolean default\r\n          to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n        force boolean default FALSE);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure set_column_stats(\r\n        ownname varchar2, tabname varchar2, colname varchar2,\r\n        partname varchar2 default null,\r\n        stattab varchar2 default null, statid varchar2 default null,\r\n        ext_stats raw,\r\n        stattypown varchar2 default null,\r\n        stattypname varchar2 default null,\r\n        statown varchar2 default null,\r\n        no_invalidate boolean default\r\n          to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n        force boolean default FALSE);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure set_index_stats(\r\n        ownname varchar2, indname varchar2,\r\n        partname varchar2 default null,\r\n        stattab varchar2 default null, statid varchar2 default null,\r\n        numrows number default null, numlblks number default null,\r\n        numdist number default null, avglblk number default null,\r\n        avgdblk number default null, clstfct number default null,\r\n        indlevel number default null, flags number default null,\r\n        statown varchar2 default null,\r\n        no_invalidate boolean default\r\n          to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n        guessq number default null,\r\n        cachedblk number default null,\r\n        cachehit number default null,\r\n        force boolean default FALSE);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure set_index_stats(\r\n        ownname varchar2, indname varchar2,\r\n        partname varchar2 default null,\r\n        stattab varchar2 default null, statid varchar2 default null,\r\n        ext_stats raw,\r\n        stattypown varchar2 default null,\r\n        stattypname varchar2 default null,\r\n        statown varchar2 default null,\r\n        no_invalidate boolean default\r\n          to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n        force boolean default FALSE);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure set_table_stats(\r\n        ownname varchar2,\r\n        tabname varchar2,\r\n        partname varchar2 default null,\r\n        stattab varchar2 default null,\r\n        statid varchar2 default null,\r\n        numrows number default null,\r\n        numblks number default null,\r\n        avgrlen number default null,\r\n        flags number default null,\r\n        statown varchar2 default null,\r\n        no_invalidate boolean default\r\n          to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n        cachedblk number default null,\r\n        cachehit number default null,\r\n        force boolean default FALSE);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure convert_raw_value(\r\n        rawval raw, resval out varchar2);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure convert_raw_value(\r\n        rawval raw, resval out date);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure convert_raw_value(\r\n        rawval raw, resval out number);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure convert_raw_value(\r\n        rawval raw, resval out binary_float);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure convert_raw_value(\r\n        rawval raw, resval out binary_double);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure convert_raw_value_nvarchar(\r\n        rawval raw, resval out nvarchar2);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure convert_raw_value_rowid(\r\n        rawval raw, resval out rowid);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure get_column_stats(\r\n        ownname varchar2, tabname varchar2, colname varchar2,\r\n        partname varchar2 default null,\r\n        stattab varchar2 default null, statid varchar2 default null,\r\n        distcnt out number, density out number,\r\n        nullcnt out number, srec out StatRec,\r\n        avgclen out number,\r\n        statown varchar2 default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure get_column_stats(\r\n        ownname varchar2, tabname varchar2, colname varchar2,\r\n        partname varchar2 default null,\r\n        stattab varchar2 default null, statid varchar2 default null,\r\n        ext_stats out raw,\r\n        stattypown out varchar2, stattypname out varchar2,\r\n        statown varchar2 default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure get_index_stats(\r\n        ownname varchar2, indname varchar2,\r\n        partname varchar2 default null,\r\n        stattab varchar2 default null, statid varchar2 default null,\r\n        numrows out number, numlblks out number,\r\n        numdist out number, avglblk out number,\r\n        avgdblk out number, clstfct out number,\r\n        indlevel out number,\r\n        statown varchar2 default null,\r\n        guessq out number,\r\n        cachedblk out number,\r\n        cachehit out number);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure get_index_stats(\r\n        ownname varchar2, indname varchar2,\r\n        partname varchar2 default null,\r\n        stattab varchar2 default null, statid varchar2 default null,\r\n        numrows out number, numlblks out number,\r\n        numdist out number, avglblk out number,\r\n        avgdblk out number, clstfct out number,\r\n        indlevel out number,\r\n        statown varchar2 default null,\r\n        guessq out number);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure get_index_stats(\r\n        ownname varchar2, indname varchar2,\r\n        partname varchar2 default null,\r\n        stattab varchar2 default null, statid varchar2 default null,\r\n        numrows out number, numlblks out number,\r\n        numdist out number, avglblk out number,\r\n        avgdblk out number, clstfct out number,\r\n        indlevel out number,\r\n        statown varchar2 default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure get_index_stats(\r\n        ownname varchar2, indname varchar2,\r\n        partname varchar2 default null,\r\n        stattab varchar2 default null, statid varchar2 default null,\r\n        ext_stats out raw,\r\n        stattypown out varchar2, stattypname out varchar2,\r\n        statown varchar2 default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure get_table_stats(\r\n        ownname varchar2, tabname varchar2,\r\n        partname varchar2 default null,\r\n        stattab varchar2 default null, statid varchar2 default null,\r\n        numrows out number, numblks out number,\r\n        avgrlen out number,\r\n        statown varchar2 default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure get_table_stats(\r\n        ownname varchar2,\r\n        tabname varchar2,\r\n        partname varchar2 default null,\r\n        stattab varchar2 default null,\r\n        statid varchar2 default null,\r\n        numrows out number,\r\n        numblks out number,\r\n        avgrlen out number,\r\n        statown varchar2 default null,\r\n        cachedblk out number,\r\n        cachehit out number);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure delete_column_stats(\r\n        ownname varchar2, tabname varchar2, colname varchar2,\r\n        partname varchar2 default null,\r\n        stattab varchar2 default null, statid varchar2 default null,\r\n        cascade_parts boolean default true,\r\n        statown varchar2 default null,\r\n        no_invalidate boolean default\r\n          to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n        force boolean default FALSE,\r\n        col_stat_type varchar2 default 'ALL');")).should be_true
		parser.items.include?(ProcedureItem.new("procedure delete_index_stats(\r\n        ownname varchar2, indname varchar2,\r\n        partname varchar2 default null,\r\n        stattab varchar2 default null, statid varchar2 default null,\r\n        cascade_parts boolean default true,\r\n        statown varchar2 default null,\r\n        no_invalidate boolean default\r\n          to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n        stattype varchar2 default 'ALL',\r\n        force boolean default FALSE);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure delete_table_stats(\r\n        ownname varchar2, tabname varchar2,\r\n        partname varchar2 default null,\r\n        stattab varchar2 default null, statid varchar2 default null,\r\n        cascade_parts boolean default true,\r\n        cascade_columns boolean default true,\r\n        cascade_indexes boolean default true,\r\n        statown varchar2 default null,\r\n        no_invalidate boolean default\r\n          to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n        stattype varchar2 default 'ALL',\r\n        force boolean default FALSE);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure delete_schema_stats(\r\n        ownname varchar2,\r\n        stattab varchar2 default null, statid varchar2 default null,\r\n        statown varchar2 default null,\r\n        no_invalidate boolean default\r\n          to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n        stattype varchar2 default 'ALL',\r\n        force boolean default FALSE);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure delete_database_stats(\r\n        stattab varchar2 default null, statid varchar2 default null,\r\n        statown varchar2 default null,\r\n        no_invalidate boolean default\r\n          to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n        stattype varchar2 default 'ALL',\r\n        force boolean default FALSE);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure create_stat_table(\r\n        ownname varchar2, stattab varchar2,\r\n        tblspace varchar2 default null,\r\n        global_temporary boolean default false);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure drop_stat_table(\r\n        ownname varchar2, stattab varchar2);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure upgrade_stat_table(\r\n        ownname varchar2, stattab varchar2);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure export_column_stats(\r\n        ownname varchar2, tabname varchar2, colname varchar2,\r\n        partname varchar2 default null,\r\n        stattab varchar2, statid varchar2 default null,\r\n        statown varchar2 default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure export_index_stats(\r\n        ownname varchar2, indname varchar2,\r\n        partname varchar2 default null,\r\n        stattab varchar2, statid varchar2 default null,\r\n        statown varchar2 default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure export_table_stats(\r\n        ownname varchar2, tabname varchar2,\r\n        partname varchar2 default null,\r\n        stattab varchar2, statid varchar2 default null,\r\n        cascade boolean default true,\r\n        statown varchar2 default null,\r\n        stat_category varchar2 default DEFAULT_STAT_CATEGORY\r\n);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure export_schema_stats(\r\n        ownname varchar2,\r\n        stattab varchar2, statid varchar2 default null,\r\n        statown varchar2 default null,\r\n        stat_category varchar2 default DEFAULT_STAT_CATEGORY);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure export_database_stats(\r\n        stattab varchar2, statid varchar2 default null,\r\n        statown varchar2 default null,\r\n        stat_category varchar2 default DEFAULT_STAT_CATEGORY);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure import_column_stats(\r\n        ownname varchar2, tabname varchar2, colname varchar2,\r\n        partname varchar2 default null,\r\n        stattab varchar2, statid varchar2 default null,\r\n        statown varchar2 default null,\r\n        no_invalidate boolean default\r\n          to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n        force boolean default FALSE);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure import_index_stats(\r\n        ownname varchar2, indname varchar2,\r\n        partname varchar2 default null,\r\n        stattab varchar2, statid varchar2 default null,\r\n        statown varchar2 default null,\r\n        no_invalidate boolean default\r\n          to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n        force boolean default FALSE);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure import_table_stats(\r\n        ownname varchar2, tabname varchar2,\r\n        partname varchar2 default null,\r\n        stattab varchar2, statid varchar2 default null,\r\n        cascade boolean default true,\r\n        statown varchar2 default null,\r\n        no_invalidate boolean default\r\n          to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n        force boolean default FALSE,\r\n        stat_category varchar2 default DEFAULT_STAT_CATEGORY);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure import_schema_stats(\r\n        ownname varchar2,\r\n        stattab varchar2, statid varchar2 default null,\r\n        statown varchar2 default null,\r\n        no_invalidate boolean default\r\n          to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n        force boolean default FALSE,\r\n        stat_category varchar2 default DEFAULT_STAT_CATEGORY);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure import_database_stats(\r\n        stattab varchar2, statid varchar2 default null,\r\n        statown varchar2 default null,\r\n        no_invalidate boolean default\r\n          to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n        force boolean default FALSE,\r\n        stat_category varchar2 default DEFAULT_STAT_CATEGORY\r\n        );")).should be_true
		parser.items.include?(ProcedureItem.new("procedure gather_index_stats\r\n    (ownname varchar2, indname varchar2, partname varchar2 default null,\r\n     estimate_percent number default DEFAULT_ESTIMATE_PERCENT,\r\n     stattab varchar2 default null, statid varchar2 default null,\r\n     statown varchar2 default null,\r\n     degree number default to_degree_type(get_param('DEGREE')),\r\n     granularity varchar2 default DEFAULT_GRANULARITY,\r\n     no_invalidate boolean default\r\n       to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n     stattype varchar2 default 'DATA',\r\n     force boolean default FALSE);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure gather_table_stats\r\n    (ownname varchar2, tabname varchar2, partname varchar2 default null,\r\n     estimate_percent number default DEFAULT_ESTIMATE_PERCENT,\r\n     block_sample boolean default FALSE,\r\n     method_opt varchar2 default DEFAULT_METHOD_OPT,\r\n     degree number default to_degree_type(get_param('DEGREE')),\r\n     granularity varchar2 default  DEFAULT_GRANULARITY,\r\n     cascade boolean default DEFAULT_CASCADE,\r\n     stattab varchar2 default null, statid varchar2 default null,\r\n     statown varchar2 default null,\r\n     no_invalidate boolean default\r\n       to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n     stattype varchar2 default 'DATA',\r\n     force boolean default FALSE,\r\n           context dbms_stats.CContext default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure gather_schema_stats\r\n    (ownname varchar2,\r\n     estimate_percent number default DEFAULT_ESTIMATE_PERCENT,\r\n     block_sample boolean default FALSE,\r\n     method_opt varchar2 default  DEFAULT_METHOD_OPT,\r\n     degree number default to_degree_type(get_param('DEGREE')),\r\n     granularity varchar2 default DEFAULT_GRANULARITY,\r\n     cascade boolean default DEFAULT_CASCADE,\r\n     stattab varchar2 default null, statid varchar2 default null,\r\n     options varchar2 default 'GATHER', objlist out ObjectTab,\r\n     statown varchar2 default null,\r\n     no_invalidate boolean default\r\n       to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n     gather_temp boolean default FALSE,\r\n     gather_fixed boolean default FALSE,\r\n     stattype varchar2 default 'DATA',\r\n     force boolean default FALSE,\r\n     obj_filter_list ObjectTab default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure gather_schema_stats\r\n    (ownname varchar2,\r\n     estimate_percent number default DEFAULT_ESTIMATE_PERCENT,\r\n     block_sample boolean default FALSE,\r\n     method_opt varchar2 default DEFAULT_METHOD_OPT,\r\n     degree number default to_degree_type(get_param('DEGREE')),\r\n     granularity varchar2 default DEFAULT_GRANULARITY,\r\n     cascade boolean default DEFAULT_CASCADE,\r\n     stattab varchar2 default null, statid varchar2 default null,\r\n     options varchar2 default 'GATHER', statown varchar2 default null,\r\n     no_invalidate boolean default\r\n       to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n     gather_temp boolean default FALSE,\r\n     gather_fixed boolean default FALSE,\r\n     stattype varchar2 default 'DATA',\r\n     force boolean default FALSE,\r\n     obj_filter_list ObjectTab default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure gather_database_stats\r\n    (estimate_percent number default DEFAULT_ESTIMATE_PERCENT,\r\n     block_sample boolean default FALSE,\r\n     method_opt varchar2 default DEFAULT_METHOD_OPT,\r\n     degree number default to_degree_type(get_param('DEGREE')),\r\n     granularity varchar2 default DEFAULT_GRANULARITY,\r\n     cascade boolean default DEFAULT_CASCADE,\r\n     stattab varchar2 default null, statid varchar2 default null,\r\n     options varchar2 default 'GATHER', objlist out ObjectTab,\r\n     statown varchar2 default null,\r\n     gather_sys boolean default TRUE,\r\n     no_invalidate boolean default\r\n       to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n     gather_temp boolean default FALSE,\r\n     gather_fixed boolean default FALSE,\r\n     stattype varchar2 default 'DATA',\r\n     obj_filter_list ObjectTab default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure gather_database_stats\r\n    (estimate_percent number default DEFAULT_ESTIMATE_PERCENT,\r\n     block_sample boolean default FALSE,\r\n     method_opt varchar2 default DEFAULT_METHOD_OPT,\r\n     degree number default to_degree_type(get_param('DEGREE')),\r\n     granularity varchar2 default DEFAULT_GRANULARITY,\r\n     cascade boolean default DEFAULT_CASCADE,\r\n     stattab varchar2 default null, statid varchar2 default null,\r\n     options varchar2 default 'GATHER', statown varchar2 default null,\r\n     gather_sys boolean default TRUE,\r\n     no_invalidate boolean default\r\n       to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n     gather_temp boolean default FALSE,\r\n     gather_fixed boolean default FALSE,\r\n     stattype varchar2 default 'DATA',\r\n     obj_filter_list ObjectTab default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure generate_stats\r\n    (ownname varchar2, objname varchar2,\r\n     organized number default 7,\r\n     force boolean default FALSE);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure flush_database_monitoring_info;")).should be_true
		parser.items.include?(ProcedureItem.new("procedure alter_schema_tab_monitoring\r\n  (ownname varchar2 default NULL, monitoring boolean default TRUE);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure alter_database_tab_monitoring\r\n  (monitoring boolean default TRUE, sysobjs boolean default FALSE);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure gather_system_stats (\r\n  gathering_mode  varchar2 default 'NOWORKLOAD',\r\n  interval  integer  default 60,\r\n  stattab   varchar2 default null,\r\n  statid    varchar2 default null,\r\n  statown   varchar2 default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure get_system_stats (\r\n   status     out   varchar2,\r\n   dstart     out   date,\r\n   dstop      out   date,\r\n   pname            varchar2,\r\n   pvalue     out   number,\r\n   stattab          varchar2 default null,\r\n   statid           varchar2 default null,\r\n   statown          varchar2 default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure set_system_stats (\r\n   pname            varchar2,\r\n   pvalue           number,\r\n   stattab          varchar2 default null,\r\n   statid           varchar2 default null,\r\n   statown          varchar2 default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure delete_system_stats (\r\n   stattab         varchar2  default nulL,\r\n   statid          varchar2  default nulL,\r\n   statown         varchar2  default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure import_system_stats (\r\n   stattab  varchar2,\r\n   statid   varchar2 default null,\r\n   statown  varchar2 default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure export_system_stats (\r\n   stattab  varchar2,\r\n   statid   varchar2 default null,\r\n   statown  varchar2 default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure gather_fixed_objects_stats\r\n    (stattab varchar2 default null, statid varchar2 default null,\r\n     statown varchar2 default null,\r\n     no_invalidate boolean default\r\n       to_no_invalidate_type(get_param('NO_INVALIDATE')));")).should be_true
		parser.items.include?(ProcedureItem.new("procedure delete_fixed_objects_stats(\r\n        stattab varchar2 default null, statid varchar2 default null,\r\n        statown varchar2 default null,\r\n        no_invalidate boolean default\r\n        to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n        force boolean default FALSE);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure export_fixed_objects_stats(\r\n        stattab varchar2, statid varchar2 default null,\r\n        statown varchar2 default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure import_fixed_objects_stats(\r\n        stattab varchar2, statid varchar2 default null,\r\n        statown varchar2 default null,\r\n        no_invalidate boolean default\r\n           to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n        force boolean default FALSE);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure gather_dictionary_stats\r\n    (comp_id varchar2 default null,\r\n     estimate_percent number default DEFAULT_ESTIMATE_PERCENT,\r\n     block_sample boolean default FALSE,\r\n     method_opt varchar2 default DEFAULT_METHOD_OPT,\r\n     degree number default to_degree_type(get_param('DEGREE')),\r\n     granularity varchar2 default DEFAULT_GRANULARITY,\r\n     cascade boolean default DEFAULT_CASCADE,\r\n     stattab varchar2 default null, statid varchar2 default null,\r\n     options varchar2 default 'GATHER AUTO', objlist out ObjectTab,\r\n     statown varchar2 default null,\r\n     no_invalidate boolean default\r\n       to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n     stattype varchar2 default 'DATA',\r\n     obj_filter_list ObjectTab default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure gather_dictionary_stats\r\n    (comp_id varchar2 default null,\r\n     estimate_percent number default DEFAULT_ESTIMATE_PERCENT,\r\n     block_sample boolean default FALSE,\r\n     method_opt varchar2 default DEFAULT_METHOD_OPT,\r\n     degree number default to_degree_type(get_param('DEGREE')),\r\n     granularity varchar2 default DEFAULT_GRANULARITY,\r\n     cascade boolean default DEFAULT_CASCADE,\r\n     stattab varchar2 default null, statid varchar2 default null,\r\n     options varchar2 default 'GATHER AUTO', statown varchar2 default null,\r\n     no_invalidate boolean default\r\n       to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n     stattype varchar2 default 'DATA',\r\n     obj_filter_list ObjectTab default null);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure delete_dictionary_stats(\r\n        stattab varchar2 default null, statid varchar2 default null,\r\n        statown varchar2 default null,\r\n        no_invalidate boolean default\r\n          to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n        stattype varchar2 default 'ALL',\r\n        force boolean default FALSE);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure export_dictionary_stats(\r\n        stattab varchar2, statid varchar2 default null,\r\n        statown varchar2 default null,\r\n        stat_category varchar2 default DEFAULT_STAT_CATEGORY);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure import_dictionary_stats(\r\n        stattab varchar2, statid varchar2 default null,\r\n        statown varchar2 default null,\r\n        no_invalidate boolean default\r\n          to_no_invalidate_type(get_param('NO_INVALIDATE')),\r\n        force boolean default FALSE,\r\n        stat_category varchar2 default DEFAULT_STAT_CATEGORY);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure lock_table_stats(\r\n    ownname varchar2,\r\n    tabname varchar2,\r\n    stattype varchar2 default 'ALL');")).should be_true
		parser.items.include?(ProcedureItem.new("procedure lock_partition_stats(\r\n    ownname varchar2,\r\n    tabname varchar2,\r\n    partname varchar2);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure lock_schema_stats(\r\n    ownname varchar2,\r\n    stattype varchar2 default 'ALL');")).should be_true
		parser.items.include?(ProcedureItem.new("procedure unlock_table_stats(\r\n    ownname varchar2,\r\n    tabname varchar2,\r\n    stattype varchar2 default 'ALL');")).should be_true
		parser.items.include?(ProcedureItem.new("procedure unlock_partition_stats(\r\n    ownname varchar2,\r\n    tabname varchar2,\r\n    partname varchar2);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure unlock_schema_stats(\r\n    ownname varchar2,\r\n    stattype varchar2 default 'ALL');")).should be_true
		parser.items.include?(ProcedureItem.new("procedure restore_table_stats(\r\n    ownname varchar2,\r\n    tabname varchar2,\r\n    as_of_timestamp timestamp with time zone,\r\n    restore_cluster_index boolean default FALSE,\r\n    force boolean default FALSE,\r\n    no_invalidate boolean default\r\n      to_no_invalidate_type(get_param('NO_INVALIDATE')));")).should be_true
		parser.items.include?(ProcedureItem.new("procedure restore_schema_stats(\r\n    ownname varchar2,\r\n    as_of_timestamp timestamp with time zone,\r\n    force boolean default FALSE,\r\n    no_invalidate boolean default\r\n      to_no_invalidate_type(get_param('NO_INVALIDATE')));")).should be_true
		parser.items.include?(ProcedureItem.new("procedure restore_database_stats(\r\n    as_of_timestamp timestamp with time zone,\r\n    force boolean default FALSE,\r\n    no_invalidate boolean default\r\n      to_no_invalidate_type(get_param('NO_INVALIDATE')));")).should be_true
		parser.items.include?(ProcedureItem.new("procedure restore_fixed_objects_stats(\r\n    as_of_timestamp timestamp with time zone,\r\n    force boolean default FALSE,\r\n    no_invalidate boolean default\r\n      to_no_invalidate_type(get_param('NO_INVALIDATE')));")).should be_true
		parser.items.include?(ProcedureItem.new("procedure restore_dictionary_stats(\r\n    as_of_timestamp timestamp with time zone,\r\n    force boolean default FALSE,\r\n    no_invalidate boolean default\r\n      to_no_invalidate_type(get_param('NO_INVALIDATE')));")).should be_true
		parser.items.include?(ProcedureItem.new("procedure restore_system_stats(\r\n    as_of_timestamp timestamp with time zone);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure purge_stats(\r\n    before_timestamp timestamp with time zone);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure alter_stats_history_retention(\r\n    retention in number);")).should be_true
		parser.items.include?(FunctionItem.new("function get_stats_history_retention return number;")).should be_true
		parser.items.include?(FunctionItem.new("function get_stats_history_availability\r\n             return timestamp with time zone;")).should be_true
		parser.items.include?(ProcedureItem.new("procedure copy_table_stats(\r\n        ownname varchar2,\r\n        tabname varchar2,\r\n        srcpartname varchar2,\r\n        dstpartname varchar2,\r\n        scale_factor number DEFAULT 1,\r\n        flags number DEFAULT null,\r\n        force boolean DEFAULT FALSE);")).should be_true
		parser.items.include?(FunctionItem.new("function diff_table_stats_in_stattab(\r\n      ownname      varchar2,\r\n      tabname      varchar2,\r\n      stattab1     varchar2,\r\n      stattab2     varchar2 default null,\r\n      pctthreshold number   default 10,\r\n      statid1      varchar2 default null,\r\n      statid2      varchar2 default null,\r\n      stattab1own  varchar2 default null,\r\n      stattab2own  varchar2 default null)\r\n   return DiffRepTab pipelined;")).should be_true
		parser.items.include?(FunctionItem.new("function diff_table_stats_in_history(\r\n      ownname      varchar2,\r\n      tabname      varchar2,\r\n      time1        timestamp with time zone,\r\n      time2        timestamp with time zone default null,\r\n      pctthreshold number   default 10)\r\n    return DiffRepTab pipelined;")).should be_true
		parser.items.include?(FunctionItem.new("function diff_table_stats_in_pending(\r\n      ownname      varchar2,\r\n      tabname      varchar2,\r\n      time_stamp   timestamp with time zone default null,\r\n      pctthreshold number   default 10)\r\n    return DiffRepTab pipelined;")).should be_true
		parser.items.include?(FunctionItem.new("function create_extended_stats(\r\n      ownname    varchar2,\r\n      tabname    varchar2,\r\n      extension  varchar2)\r\n    return varchar2;")).should be_true
		parser.items.include?(FunctionItem.new("function create_extended_stats(\r\n      ownname    varchar2,\r\n      tabname    varchar2)\r\n    return clob;")).should be_true
		parser.items.include?(FunctionItem.new("function show_extended_stats_name(\r\n      ownname    varchar2,\r\n      tabname    varchar2,\r\n      extension  varchar2)\r\n    return varchar2;")).should be_true
		parser.items.include?(ProcedureItem.new("procedure drop_extended_stats(\r\n      ownname    varchar2,\r\n      tabname    varchar2,\r\n      extension  varchar2);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure merge_col_usage(\r\n      dblink varchar2);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure seed_col_usage(\r\n      sqlset_name IN         VARCHAR2,\r\n      owner_name  IN         VARCHAR2,\r\n      time_limit  IN         POSITIVE DEFAULT NULL);")).should be_true
		parser.items.include?(ProcedureItem.new("procedure reset_col_usage(\r\n      ownname      varchar2,\r\n      tabname      varchar2);")).should be_true
		parser.items.include?(FunctionItem.new("function report_col_usage(\r\n      ownname      varchar2,\r\n      tabname      varchar2)  return clob;")).should be_true
		parser.items.include?(ProcedureItem.new("procedure gather_database_stats_job_proc;")).should be_true
		parser.items.include?(ProcedureItem.new("procedure cleanup_stats_job_proc(\r\n      ctx number, job_owner varchar2, job_name varchar2,\r\n      sesid number, sesser number);")).should be_true
  end

  it 'should work with a SYS package spec' do
    text = File.open('spec/sql/dbms_crypto.spc', 'rb') { |file| file.read }
    parser = Vorax::Parser::Declare.new(text)
		parser.items.include?(ConstantItem.new("HASH_MD4",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("HASH_MD5",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("HASH_SH1",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("HMAC_MD5",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("HMAC_SH1",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("ENCRYPT_DES",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("ENCRYPT_3DES_2KEY",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("ENCRYPT_3DES",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("ENCRYPT_AES",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("ENCRYPT_PBE_MD5DES",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("ENCRYPT_AES128",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("ENCRYPT_AES192",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("ENCRYPT_AES256",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("CHAIN_CBC",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("CHAIN_CFB",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("CHAIN_ECB",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("CHAIN_OFB",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("PAD_PKCS5",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("PAD_NONE",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("PAD_ZERO",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("PAD_ORCL",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("ENCRYPT_RC4",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("DES_CBC_PKCS5",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("DES3_CBC_PKCS5",  "PLS_INTEGER")).should be_true
		parser.items.include?(ConstantItem.new("AES_CBC_PKCS5",  "PLS_INTEGER")).should be_true
		parser.items.include?(ExceptionItem.new("CipherSuiteInvalid")).should be_true
		parser.items.include?(ExceptionItem.new("CipherSuiteNull")).should be_true
		parser.items.include?(ExceptionItem.new("KeyNull")).should be_true
		parser.items.include?(ExceptionItem.new("KeyBadSize")).should be_true
		parser.items.include?(ExceptionItem.new("DoubleEncryption")).should be_true
		parser.items.include?(FunctionItem.new("FUNCTION  Encrypt (src IN            RAW,\r\n                       typ IN            PLS_INTEGER,\r\n                       key IN            RAW,\r\n                       iv  IN            RAW          DEFAULT NULL)\r\n      RETURN RAW;")).should be_true
		parser.items.include?(ProcedureItem.new("PROCEDURE Encrypt (dst IN OUT NOCOPY BLOB,\r\n                       src IN            BLOB,\r\n                       typ IN            PLS_INTEGER,\r\n                       key IN            RAW,\r\n                       iv  IN            RAW          DEFAULT NULL);")).should be_true
		parser.items.include?(ProcedureItem.new("PROCEDURE Encrypt (dst IN OUT NOCOPY BLOB,\r\n                       src IN            CLOB         CHARACTER SET ANY_CS,\r\n                       typ IN            PLS_INTEGER,\r\n                       key IN            RAW,\r\n                       iv  IN            RAW          DEFAULT NULL);")).should be_true
		parser.items.include?(FunctionItem.new("FUNCTION  Decrypt (src IN            RAW,\r\n                       typ IN            PLS_INTEGER,\r\n                       key IN            RAW,\r\n                       iv  IN            RAW          DEFAULT NULL)\r\n       RETURN RAW;")).should be_true
		parser.items.include?(ProcedureItem.new("PROCEDURE Decrypt (dst IN OUT NOCOPY BLOB,\r\n                       src IN            BLOB,\r\n                       typ IN            PLS_INTEGER,\r\n                       key IN            RAW,\r\n                       iv  IN            RAW          DEFAULT NULL);")).should be_true
		parser.items.include?(ProcedureItem.new("PROCEDURE Decrypt (dst IN OUT NOCOPY CLOB         CHARACTER SET ANY_CS,\r\n                       src IN            BLOB,\r\n                       typ IN            PLS_INTEGER,\r\n                       key IN            RAW,\r\n                       iv  IN            RAW          DEFAULT NULL);")).should be_true
		parser.items.include?(FunctionItem.new("FUNCTION Hash (src IN RAW,\r\n                   typ IN PLS_INTEGER)\r\n      RETURN RAW DETERMINISTIC;")).should be_true
		parser.items.include?(FunctionItem.new("FUNCTION Hash (src IN BLOB,\r\n                   typ IN PLS_INTEGER)\r\n      RETURN RAW DETERMINISTIC;")).should be_true
		parser.items.include?(FunctionItem.new("FUNCTION Hash (src IN CLOB        CHARACTER SET ANY_CS,\r\n                   typ IN PLS_INTEGER)\r\n      RETURN RAW DETERMINISTIC;")).should be_true
		parser.items.include?(FunctionItem.new("FUNCTION Mac (src IN RAW,\r\n                  typ IN PLS_INTEGER,\r\n                  key IN RAW)\r\n      RETURN RAW;")).should be_true
		parser.items.include?(FunctionItem.new("FUNCTION Mac (src IN BLOB,\r\n                  typ IN PLS_INTEGER,\r\n                  key IN RAW)\r\n      RETURN RAW;")).should be_true
		parser.items.include?(FunctionItem.new("FUNCTION Mac (src IN CLOB         CHARACTER SET ANY_CS,\r\n                  typ IN PLS_INTEGER,\r\n                  key IN RAW)\r\n      RETURN RAW;")).should be_true
		parser.items.include?(FunctionItem.new("FUNCTION RandomBytes (number_bytes IN PLS_INTEGER)\r\n      RETURN RAW;")).should be_true
		parser.items.include?(FunctionItem.new("FUNCTION RandomNumber\r\n      RETURN NUMBER;")).should be_true
		parser.items.include?(FunctionItem.new("FUNCTION RandomInteger\r\n      RETURN BINARY_INTEGER;")).should be_true
  end

end
