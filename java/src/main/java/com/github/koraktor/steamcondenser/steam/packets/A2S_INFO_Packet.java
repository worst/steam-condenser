/**
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2008-2009, Sebastian Staudt
 */

package com.github.koraktor.steamcondenser.steam.packets;

/**
 * @author Sebastian Staudt
 */
public class A2S_INFO_Packet extends SteamPacket {

	public A2S_INFO_Packet() {
		super(SteamPacket.A2S_INFO_HEADER, "Source Engine Query\0".getBytes());
	}
}
