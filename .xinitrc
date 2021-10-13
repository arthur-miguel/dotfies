#! /bin/bash

mem(){
    free -m | awk 'NR==2{printf " %s/%sMB\n", $3,$2,$3*100/$2 }'
}

disk(){
    df -h | awk '$NF=="/"{printf " %d/%dGB", $3,$2,$5}'
}

proc(){
    awk '{u=$2+$4; t=$2+$4+$5; 
    if (NR==1){
        u1=u; 
        t1=t;
    } else { 
        printf(" %.2f%",($2+$4-u1) * 100 / (t-t1)) ; 
    }
    }' <(grep 'cpu ' /proc/stat) <(sleep 1;grep 'cpu ' /proc/stat)
}

#proc(){
#    awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else printf(" %.2f%",($2+$4-u1) * 100 / (t-t1)) ; }' \
#        <(grep 'cpu ' /proc/stat) <(sleep 1;grep 'cpu ' /proc/stat)
#}

net(){
    awk '{ if (l1) {
        printf(" ↓%.1fkB/s ↑%.1fkB/s",($2-l1)/1024,($10-l2)/1024);                
        } else {
            l1=$2;             
            l2=$10;                    
        }   
    }' <(grep wlp6s0 /proc/net/dev) <(sleep 1; grep wlp6s0 /proc/net/dev)
}

while true; do
   xsetroot -name "$(net) | $(proc) | $(mem) | $(disk) | $( date +"%F %R"  )"
   sleep 1s
done &

nitrogen --restore &
exec xcompmgr -o.9 &

exec dwm
