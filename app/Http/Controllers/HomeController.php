<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use LRedis;


class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('home');
    }

    public function users(){
        return 'I am User number ' . Auth::user()->id;
    }


    public function getOnline(Request $request){


        $redis = LRedis::connection();
        $userList = [];
        foreach($request->users as $user){
            if (is_numeric($user))
            array_push($userList,\App\User::find($user)->name);
        }

        $data = ['users' => json_encode($userList)];
        $redis->publish('online', json_encode($data));
        return response()->json([]);

//
//        $users = $request->users;
//         $html = '';
//        foreach ($users as $key => $user){
//            $html .= '<li> User' . $user . ' <li>';
//        };
//
//        return $html;
    }
}
