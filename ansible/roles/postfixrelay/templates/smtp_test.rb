#!/usr/bin/env ruby

require 'net/smtp'

def send_email(to,opts={})
    opts[:port]        ||= 25
    opts[:server]      ||= '0.0.0.0'
    opts[:from]        ||= 'no-reply@starwarsccg.org'
    opts[:from_alias]  ||= 'Example Emailer'
    opts[:from_domain] ||= 'starwarsccg.org'
    opts[:subject]     ||= "You need to see this"
    opts[:body]        ||= "Important stuff!"
    opts[:user]        ||= "{{ postfix_smtp_username }}"
    opts[:secret]      ||= "{{ postfix_smtp_password }}"
    opts[:authtype]    ||= :login

    msg = <<END_OF_MESSAGE
From: #{opts[:from_alias]} <#{opts[:from]}>
To: <#{to}>
Subject: #{opts[:subject]}

#{opts[:body]}
END_OF_MESSAGE

    Net::SMTP.start(opts[:server], opts[:port], opts[:from_domain], opts[:user], opts[:secret], opts[:authtype]) do |smtp|
      smtp.send_message msg, opts[:from], to
    end ### Net::SMTP

  end ### def



  send_email "devon@hubner.org",
            :from       => "no-reply@starwarsccg.org",
            :from_alias => "Postfix Test",
            :subject    => "Testing Postfix MTA",
            :body       => Time.new.to_s + "\r\n\r\n This is a test message from Devon verifying that SMTP works.\r\n\r\n"









