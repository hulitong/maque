<?php
namespace app\admin\controller;
use think\Controller;
use think\Request;
use think\Db;
use think\Session;
/**
 * 
 */
class Login extends Controller
{
	
	public function index(){

		return $this->fetch();
	}

	public function checkIn(){

		if(!Request()->isPost()){

			$this->error('非法请求，请正确登录');
		}
		
		$data = input('param.');

		if(empty($data['pwd']) || empty($data['username'])){
			$this->error('账号或密码不能为空');
		}
		$hlt = Db::name('roots')
					->where('username','=',$data['username'])
					->where('pwd','=',$data['pwd'])
					->find();
				
		if($hlt){

			// 如果账号密码一致，改变status的状态，默认为0，登录后变成1
			// $status = Db::name('roots')->where('status','eq',1)->find();
			// if ($status) {
			// 	Db::name('roots')->update('status',1);
			// }
			// session_start();
			
			Session::set('username',$data['username']);

			$this->success('登录成功','Index/index',2);
			
		}else{
			return	$this->error('账号或密码错误，登录失败');
		}		
			
		
		
	}

	public function checkOut(){
		Session::delete('username');
		$res = Session::has('username');
		if(empty($res)){
			$this->success('恭喜您退出登录','Login/index');
		}else{
			$this->error('您还不能退出登录','Index/index');
		}
	}

}