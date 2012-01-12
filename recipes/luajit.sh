
local URL="http://luajit.org/download/LuaJIT-2.0.0-beta9.tar.gz"
local tb_file=`basename $URL`
local type="tar.gz"
local seed_name="LuaJIT-2.0.0-beta9"
local deps=()
local install_files=(src/luajit)

do_install()
{
  before_install $seed_name
  cd $TB_DIR
  download $URL $tb_file
  decompress_tool $tb_file $type
  cd $seed_name
  make_tool $seed_name $make_j
  log "linking: $TB_DIR/$seed_name/src/luajit -> $LOCAL_DIR/bin"
  ln -s $TB_DIR/$seed_name/src/luajit $LOCAL_DIR/bin
  after_install $seed_name
}

do_remove()
{
  before_remove $seed_name
  remove_recipe $seed_name
  remove_from_stage $seed_name ${install_files[@]}
  after_remove $seed_name
}

source "$MAIN_DIR/lib/case.sh"
