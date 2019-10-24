<?php
namespace app\admin\controller;
use think\Controller;
use think\Request;
use think\Db;
use app\admin\model\Roots;

/**
 * 
 */
class Root extends Base
{	

	/**
	 *  通过字段查询
	 */
	
	public function  searchRoot(){
		$searchData = Db::name('roots')
						->where('username')
						->where('tel')
						->where('email')
						->select();

		$this->assign('searchData',$searchData);
	}

	public function index(){
		$data = Db::name('roots')->paginate();
		$this->assign('DataRoot',$data);
		return $this->fetch();
	}
	public function addRoot(){
		return view();
	}
	public function saveAddRoot(){
		
		if (request()->isPost()) {
			$arr = input('param.');
			//获取IP
			$request = Request::instance();
			$arr['last_login_ip']=$request->ip();
			// 获取当前时间
			$arr['last_login_time']=time();
			// $arr['create_time']=time();
			
			$infolist = Db::name('roots')->where('username',$arr['username'])->find();

			if ($infolist) {
				return $this->error('用户已存在，不能重名');
			}
			$res = Db::name('roots')->insert($arr);

			if ($res) {
				return $this->success('添加成功','Root/index',2);
			}else{
				return $this->error('添加失败！');
			}
			
		}else{
			return	$this->error('非法请求');
		}
	}
	
	// 接收id，通过id查询该条数据，并且赋值
	public function editRoot(){

		// 接收id
		$id = input('id');
		// console.log($id);
		// 通过id查询内容
		$list = Db::name('roots')->where('id','=',$id)->find();

		$this->assign('list',$list);
		return $this->fetch();
	}

	//更新管理员 
	public function updateRoot(){
		if (Request()->isPost()) {
			
			$data1 = input('param.');
			$id = input('id');
			// $data1['update_time']=time();
			// var_dump($id);die;
			// var_dump($data1);die;
			$resdata = Db::name('roots')->where('id',$id)->update($data1);
			// var_dump($resdata);die;
			if ($resdata) {
				return	$this->success('更新成功','Root/index',2);
			}else{
				return  $this->error('更新失败');
			}
		}
	}

	//删除管理员
	public function deleteRoot(){

		if (Request()->isGet()) {
			$id = input('id');
			// var_dump($id);die;
			$res = Db::name('roots')->where('id',$id)->delete();
			if ($res) {
				return	$this->success('删除成功','Root/index',2);
			}else{
				return  $this->error('删除失败');
			}
		}
	}


	public function role(){
		$list = Db::name('role')->select();
		$this->assign('list',$list);
		return $this->fetch();
	}
	public function showRole(){

		return $this->fetch();
	}

	public function addRole(){

		if (Request()->isPost()) {
			$data = input('param.');

			$res = Db::name('role')->insert($data);

			if ($res) {
				return	$this->success('添加成功','Root/role',2);
			}else{
				return	$this->error('添加失败');
			}
		}
	}
}