## Baixando o projeto
No seu terminal, cmd, power shell ou bash execute os seguintes comandos:
- `git clone https://github.com/juliovinnicius/front_atak.git`
- `cd front_atak`
- `flutter pub get`

### Rodando projeto
> Primeiro baixe e rode a api feita em node no link https://github.com/juliovinnicius/teste_atak_api

> A aplicação utiliza o recurso de generators do Flutter, logo precisamos rodar o build_runner para gerar os códigos necessários para o desenvolvimento.
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

> Se você estiver executando o servidor localmente e usando o emulador do Android, o endpoint do servidor deve ser 192.168.x.x em vez de localhost:3000. Portanto vá até o arquivo lib/modules/external/search_datasource_impl.dart e na linha 14 substitua o ip pelo o seu ipv4.
![image](https://user-images.githubusercontent.com/50780080/201740080-d25189c7-6ab7-4527-8fc6-5ddf2644b87e.png)

> Execute o comando
```bash
flutter run
```
