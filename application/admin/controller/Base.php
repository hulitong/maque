<?php
namespace app\admin\controller;
use think\Controller;
use think\Session;
/**
 * 
 */
class Base extends Controller
{
	
	public function _initialize(){
		// $res=Session::get('username');
		$res = Session::has('username');
		if(empty($res)){
			$this->error('抱歉，您还没有登录，请登录后再操作','Login/index');
		}
	}
}