<?php

namespace App\Http\Controllers;

use App\Message;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Events\MessageSent;
use DB;


class ChatsController extends Controller
{
    public function __construct()
	{
	  $this->middleware('auth');
	}

	public function index()
	{
	  return view('chat');
	}

	public function fetchMessages()
	{
	  return Message::with('user')->get();
	}

	public function sendMessage(Request $request)
	{
	  $user = Auth::user();

	  $message = $user->messages()->create([
	    'message' => $request->input('message')
	  ]);

	   broadcast(new MessageSent($user, $message))->toOthers();


	  return ['status' => 'Message Sent!'];
	}

	public function userMessages($friend){
		$user=Auth::user()->id;
		// return $friend;
		$inbox=DB::table('inbox')->where([['sender',$friend],['receiver',$user]]);
		$outbox=DB::table('outbox')->where([['sender',$user],['receiver',$friend]])
		->union($inbox)
		->orderBy('created_at', 'asc')
		->get();
		return $outbox;
}
}
