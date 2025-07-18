variable "vpc_cidr" {
  type = string
  description = "vpc cidr values"
}
# 10.0.0.0 represents the network address 
# /16 means the first 16 bits of the IP address are fixed and represent the network part
# 👉 The remaining 16 bits are used for the hosts (devices, servers, VMs, containers, etc.) inside that network.

# and we start with 10.x.x.x becuase its part of the reserved private ip ranges

# how to calculate binary using on and off
# 128 64 32 16 8 4 2 1
# 0   0  0  0  0 0 0 0

# calcualate for 10
# smaller number than 10 is 8 do ( 10-8 = 2 ) and turn 8 ON  ( 0 -> 1 )
# we are remaining with 2 (2 - 4 = X ) keep 4 OFF 
# we still have 2 do (2-2 = 0 ) and turn 2 ON ( 0 -> 1 )
# now we have turned 8 and 2 on we get 

# 128 64 32 16 8 4 2 1
# 0   0  0  0  1 0 1 0    to get 10 just add the ONs ( 8 + 2 )
#                         10 -> ( 00001010 )