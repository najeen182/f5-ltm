resource "bigip_ltm_irule" "test-irule" {
  name  = "/Common/test-irule"
  irule = <<EOF
when HTTP_REQUEST {
	if {[HTTP::host] equals "test-tf.${var.domain}"} {
		HTTP::header insert Host [HTTP::host]:[TCP::local_port]
		HTTP::header insert X-Real-IP [IP::client_addr]
		HTTP::header insert X-Forwarded-For [IP::client_addr]

		# Disable the stream filter for all requests
		STREAM::disable
		
		# LTM does not decompress response content, so if the server has compression enabled
		# and it cannot be disabled on the server, we can prevent the server from
		# sending a compressed response by removing the compression offerings from the client
		HTTP::header remove "Accept-Encoding"
	}
}


when HTTP_REQUEST_RELEASE {
    log local0. "[IP::client_addr] [HTTP::method] [HTTP::version] [HTTP::host] [HTTP::uri] Upstream: [IP::server_addr] User Agent: [HTTP::header "User-Agent"]"
}


when HTTP_RESPONSE {
    # Check if response type is text
    if {[HTTP::header value Content-Type] contains "text"} {
        # Replace http:// with https://
        STREAM::expression {@http://@https://@}
        # Enable the stream filter for this response only
        STREAM::enable
        }   
}
EOF

}
