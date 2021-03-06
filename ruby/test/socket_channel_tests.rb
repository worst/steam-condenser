# This code is free software; you can redistribute it and/or modify it under the
# terms of the new BSD License.
#
# Copyright (c) 2009-2010, Sebastian Staudt

$:.push File.join(File.dirname(__FILE__), '..', 'lib')

require 'test/unit'

require 'stringio_additions'
require 'socket_channel'

class SocketChannelTests < Test::Unit::TestCase

  def test_read_write
    port = rand(65536 - 1024) + 1024

    server = TCPServer.new('localhost', port)

    channel = SocketChannel.open
    channel.connect Socket.getaddrinfo('localhost', port)

    socket= server.accept

    string = 'test'

    buffer = StringIO.new string
    channel.write(buffer)
    sent, socket_addr = socket.recvfrom(4)
    socket.send(string, 0)
    buffer = StringIO.allocate 4
    channel.read(buffer)

    channel.close
    socket.close

    received = buffer.string

    assert_equal(string, sent)
    assert_equal(string, received)
  end

end
