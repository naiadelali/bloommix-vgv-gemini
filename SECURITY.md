# 🔒 Guia de Segurança - Bloomix

Este documento explica como manter suas informações sensíveis seguras no projeto Bloomix.

## ⚠️ Arquivos Sensíveis Ignorados

Os seguintes arquivos estão no `.gitignore` e **NUNCA** devem ser commitados:

### 🔑 Configurações e Senhas
- `config.json` - Suas chaves de API reais
- `config.production.json` - Configurações de produção
- `config.staging.json` - Configurações de staging
- `.env*` - Variáveis de ambiente
- `passwords.txt` - Arquivos com senhas
- `tokens.txt` - Tokens de acesso
- `secrets.txt` - Informações secretas
- `credentials.txt` - Credenciais
- `api_keys.txt` - Chaves de API

### 📱 Certificados e Chaves Mobile
- `android/key.properties` - Propriedades da keystore Android
- `android/keystore/` - Diretório com keystores
- `android/app/*.jks` - Keystores Java
- `android/app/*.keystore` - Keystores Android
- `ios/*.p8` - Chaves privadas iOS
- `ios/*.p12` - Certificados iOS
- `ios/*.mobileprovision` - Profiles de provisionamento

### 🔥 Firebase e Google Cloud
- `google-services.json` - Configuração Firebase Android
- `GoogleService-Info.plist` - Configuração Firebase iOS
- `firebase_options.dart` - Opções Firebase geradas
- `service-account-key.json` - Chave da conta de serviço

## 🛡️ Como Manter Segurança

### 1. **Use Arquivos de Exemplo**
```bash
# Sempre use o arquivo de exemplo como base
cp config.example.json config.json
# Edite apenas o config.json (não versionado)
```

### 2. **Verifique Antes de Commitar**
```bash
# Verifique o que será commitado
git status
git diff --cached

# Se aparecer arquivos sensíveis, remova-os
git reset HEAD arquivo_sensivel.txt
```

### 3. **Use Variáveis de Ambiente**
```bash
# Em vez de hardcoded, use:
export GEMINI_API_KEY="sua_chave_aqui"
export AD_UNIT_ID="seu_id_aqui"
```

### 4. **Revise Commits Antes de Push**
```bash
# Verifique o histórico antes de enviar
git log --oneline -5
git push origin main
```

## 🚨 Se Você Acidentalmente Commitou Dados Sensíveis

### 1. **Remova do Histório**
```bash
# Remove arquivo do último commit
git reset --soft HEAD~1
git reset HEAD arquivo_sensivel.txt
git commit -m "Remove arquivo sensível"
```

### 2. **Se Já Foi Enviado para o Repositório**
```bash
# Use git filter-branch para remover do histórico
git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch arquivo_sensivel.txt' \
  --prune-empty --tag-name-filter cat -- --all
```

### 3. **Force Push (CUIDADO!)**
```bash
# Só faça isso se tiver certeza
git push origin main --force
```

## 📋 Checklist de Segurança

Antes de cada commit, verifique:

- [ ] Não há arquivos `config.json` no staging
- [ ] Não há chaves de API hardcoded no código
- [ ] Não há senhas em comentários ou strings
- [ ] Arquivos `.env*` não estão sendo commitados
- [ ] Certificados e keystores não estão no repositório
- [ ] Logs não contêm informações sensíveis

## 🔍 Comandos Úteis

```bash
# Verificar arquivos ignorados
git check-ignore -v arquivo.txt

# Listar arquivos ignorados
git ls-files --ignored --exclude-standard

# Verificar se arquivo está sendo rastreado
git ls-files | grep config.json

# Limpar cache do Git
git rm --cached arquivo_sensivel.txt
```

## 📞 Suporte

Se você acidentalmente expôs informações sensíveis:

1. **NÃO ENTRE EM PÂNICO**
2. **Revise o histórico** com os comandos acima
3. **Remova as informações** do repositório
4. **Considere regenerar** chaves de API se necessário
5. **Force push** apenas se necessário

---

**Lembre-se**: É melhor ser cauteloso do que ter informações sensíveis expostas publicamente! 🔒
