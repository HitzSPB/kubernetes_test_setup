
# Docker Swarm vs Kubernetes

## Kubernetes

Pros

- Includes dashboard
- Enterprise ready produkt
- Uddanelse og certifikater
- Mulighed for 100% cloud løsninger

Cons
- Skal have en linux master node


## Docker Swarm
pros
- Nemt setup

cons

## Produkt popularitet

### IBM om Kubernetes
![](https://i.gyazo.com/1b896eecd6699bed3e6a58edbce6d4b5.png)

### IBM om Docker swarm
![](https://i.gyazo.com/a055bef1315756e4bb002f9f8426144f.png)

### Udannelse 

#### Kubernetes
![](https://i.gyazo.com/a2e509335dd96469a88380189c1d74c1.png)
![](https://i.gyazo.com/3afa365b705f1054009f1a8e74890215.png)
![](https://i.gyazo.com/8ed1ee387638dbd81fdf499bb6ee693f.png)
![](https://i.gyazo.com/45e9c077cffb296e10c8a562b5ab6d31.png)

#### Docker Swarm
![](https://i.gyazo.com/80e143de11eb5942dbe63e696a8bdd3a.png)
![](https://i.gyazo.com/ed275b4b178d364806a8884208ce1c91.png)
![](https://i.gyazo.com/fcb44d210a2b014d32d53ebf9595af80.png)
https://hackr.io/blog/best-docker-certification (Official?/ Docker Certified Associate)

### Udvikling aktivitet
![Docker swarm activity amount](https://i.gyazo.com/4d8b978f3ec61e798cf7fd078e847449.png)

![Kubernetes activity amount](https://i.gyazo.com/66d5471e00b9262d993ac5cb079b2d8a.png)
https://github.com/kubernetes/kubernetes/tree/master/CHANGELOG

### Installation of kubernetes

Open ports

![Ports to be opened](https://i.gyazo.com/efc231b9cc8c1644a32aa989196ef2f4.png)

Disable swapp 


## Konklusion
Kubernetes ser ud til at være den platform som vil holde i fremtiden. Den har den største bruger base og bedste uddannelser. Hvis vi gerne vil betale os fra det, kan vi køre aks eller aks hybrid(https://github.com/Azure/aks-engine/blob/master/docs/topics/hybrid-environment.md#running-kubernetes-in-a-hybrid-environment). Selve server setup kan godt være lidt besværlig fordi vi skal have en linux master node og derefter en windows node. Men når serveren først er lavet er det lige til med yml filer som vi kender i dag fra dependency flow, og nemt at oversætte en dependency flow fil til en kubernetes pod fil.
Der er god hjælp og hente fordi der er et kæmpe stort open source community at snakke med.

Hvis vi skal have noget hurtigt her og nu. Er docker Swarm klart en mulighed, men på sigt kan jeg godt have min tvivl, især når docker flere gange har været på randen af konkurs og kubernetes som sådan er gået væk fra at bruge docker som default. Docker swarm ser dog ud til at være den nemme løsning hvis man skal lave noget hurtigt i håndan. Automatision mulighederne har jeg ikke nået at kigge på.


Kigger man på konsulent hjælp, er der klart flere som tilbyder konsulent hjælp til kubernetes også med virksomheder unik har arbejdet med før. Docker swarm var der et par udlandske konsulenter som kunne hjælpe remote. 
