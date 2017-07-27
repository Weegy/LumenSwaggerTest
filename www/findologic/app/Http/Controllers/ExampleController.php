<?php

namespace App\Http\Controllers;

use Swagger\Annotations as SWG;

class ExampleController extends Controller {
	/**
	 * Create a new controller instance.
	 *
	 * @return void
	 */

	public function __construct() {
		//
	}


	/**
	 * @SWG\Get(
	 *     path="/example/",
	 *     summary="Test Call",
	 *     description="LOREM IPSUM",
	 *     operationId="testGetCall",
	 *     produces={"application/json"},
	 *     @SWG\Response(
	 *     response="200",
	 *     description="success"
	 * )
	 * )
	 */
	public function testGetCall() {
		return response()->json("success");
	}

}
