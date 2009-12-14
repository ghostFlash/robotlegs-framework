/*
 * Copyright (c) 2009 the original author or authors
 * 
 * Permission is hereby granted to use, modify, and distribute this file 
 * in accordance with the terms of the license agreement accompanying it.
 */

package org.robotlegs.mvcs.xmlconfig
{
	import flash.events.EventDispatcher;
	
	import org.robotlegs.adapters.SwiftSuspendersInjector;
	import org.robotlegs.base.CommandMap;
	import org.robotlegs.base.CommandMapTests;
	import org.robotlegs.mvcs.support.ICommandTest;
	
	public class CommandMapTests extends org.robotlegs.base.CommandMapTests
	{
		protected static const XML_CONFIG : XML =
			<types>
				<type name='org.robotlegs.mvcs.support::EventCommand'>
					<field name='testSuite'/>
				</type>
			</types>;
		
		[Before]
		override public function runBeforeEachTest():void
		{
			eventDispatcher = new EventDispatcher();
			injector = new SwiftSuspendersInjector(XML_CONFIG);
			commandMap = new CommandMap(eventDispatcher, injector);
			injector.mapValue(ICommandTest, this);
		}
	}
}
