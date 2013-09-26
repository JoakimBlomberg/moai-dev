// Copyright (c) 2010-2011 Zipline Games, Inc. All Rights Reserved.
// http://getmoai.com

#ifndef	MOAIJSONPARSER_H
#define	MOAIJSONPARSER_H
#if MOAI_WITH_JANSSON

//================================================================//
// MOAIJsonParser
//================================================================//
/**	@name	MOAIJsonParser
	@text	Converts between Lua and JSON.
*/
class MOAIJsonParser :
	public MOAIGlobalClass < MOAIJsonParser, MOAILuaObject > {
private:

	//----------------------------------------------------------------//
	static int			_decode					( lua_State* L );
	static int			_encode					( lua_State* L );

public:
	
	DECL_LUA_SINGLETON ( MOAIJsonParser )
	
	//----------------------------------------------------------------//
						MOAIJsonParser			();
						~MOAIJsonParser			();
	void				RegisterLuaClass		( MOAILuaState& state );
	void				RegisterLuaFuncs		( MOAILuaState& state );

	static int			Encode 					( lua_State* L );
	static int			Decode 					( lua_State* L );
};

#endif
#endif