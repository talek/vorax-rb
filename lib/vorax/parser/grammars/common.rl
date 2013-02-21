%%{

machine common;

# strings
squote = "'";
not_squote = [^''];
escaped_quote = /''/;
squoted_string = squote ( not_squote | escaped_quote )* squote;
dquoted_string = '"' ( any )* :>> '"';

# comments
ml_comment = '/*' ( any )* :>> '*/';
sl_comment = '--' ( any )* :>> '\n';
comment = ml_comment | sl_comment;

# define whitespace
ws = space | comment;

# identifier
simple_identifier = [A-Za-z_$#][0-9A-Za-z_$#]*;
identifier = simple_identifier | dquoted_string;

# define intereseting keywords
K_END = /end/i;
K_REVERSE = /reverse/i;
K_FOR = /for/i;
K_IN = /in/i;
K_IF = /if/i;
K_LOOP = /loop/i;
K_PRAGMA = /pragma/i;
K_SELECT = /select/i;
K_FROM = /from/i;
K_WITH = /with/i;
K_AS = /as/i;
K_IS = /is/i;
K_JOIN = /join/i;
K_TRIGGER = /trigger/i;
K_FUNCTION = /function/i;
K_PROCEDURE = /procedure/i;
K_BEGIN = /begin/i;
K_DECLARE = /declare/i;
K_CREATE = /create/i;
K_OR = /or/i;
K_REPLACE = /replace/i;
K_PACKAGE = /package/i;
K_BODY = /body/i;
K_TYPE = /type/i;
K_AND = /and/i;
K_RESOLVE = /resolve/i;
K_COMPILE = /compile/i;
K_NOFORCE = /noforce/i;
K_JAVA = /java/i;
K_TRANSACTION = /transaction/i;
K_CONSTANT = /constant/i;
K_CURSOR = /cursor/i;
K_EXCEPTION = /exception/i;

# sqlplus keywords (without APPEND, CHANGE, DEL, GET, INPUT, LIST)
K_ACCEPT = /accept/i | /accep/i | /acce/i | /acc/i;
K_ARCHIVE = /archive/i;
K_ATTRIBUTE = /attribute/i;
K_BREAK = /break/i | /brea/i | /bre/i;
K_BTITLE = /btitle/i | /btitl/i | /btit/i | /bti/i;
K_CLEAR = /clear/i | /clea/i | /cle/i | /cl/i;
K_COLUMN = /column/i | /colum/i | /colu/i | /col/i;
K_COMPUTE = /compute/i | /comput/i | /compu/i | /comp/i;
K_CONNECT = /connect/i | /connec/i | /conne/i | /conn/i;
K_COPY = /copy/i;
K_DEFINE = /define/i | /defin/i | /defi/i | /def/i;
K_DESCRIBE = /describe/i | /describ/i | /descri/i | /descr/i | /desc/i;
K_DISCONNECT = /disconnect/i | /disconnec/i | /disconne/i | /disconn/i | /discon/i | /disco/i | /disc/i;
K_EXECUTE = /execute/i | /execut/i | /execu/i | /exec/i;
K_EXIT = /exit/i | /quit/i;
K_HELP = /help/i;
K_HOST = /host/i;
K_PASSWORD = /password/i | /passwor/i | /passwo/i | /passw/i;
K_PAUSE = /pause/i | /paus/i | /pau/i;
K_PRINT = /print/i;
K_PROMPT = /prompt/i | /promp/i | /prom/i | /pro/i;
K_RECOVER = /recover/i;
K_REMARK = /remark/i | /remar/i | /rema/i | /rem/i;
K_REPFOOTER = /repfooter/i | /repfoote/i | /repfoot/i | /repfoo/i | /repfo/i | /repf/i;
K_REPHEADER = /repheader/i | /repheade/i | /rephead/i | /rephea/i | /rephe/i | /reph/i;
K_RUN = /run/i | /ru/i;
K_SAVE = /save/i | /sav/i;
K_SET = /set/i;
K_SHOW = /show/i | /sho/i;
K_SHUTDOWN = /shutdown/i;
K_SPOOL = /spool/i | /spoo/i | /spo/i;
K_START = /start/i | /star/i | /sta/i;
K_STARTUP = /startup/i;
K_STORE = /store/i;
K_TIMING = /timing/i | /timin/i | /timi/i | /tim/i;
K_TITLE = /title/i | /titl/i | /tit/i;
K_UNDEFINE = /undefine/i | /undefin/i | /undefi/i | /undef/i;
K_VARIABLE = /variable/i | /variabl/i | /variab/i | /varia/i | /vari/i | /var/i;
K_WHENEVER = /whenever/i;
K_XQUERY = /xquery/i;

}%%
