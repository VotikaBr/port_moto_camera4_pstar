# 📱 Motorola Camera4 PStar Port for Infinity X

**🇧🇷 [Leia em Português](#-port-da-câmera-motorola-camera4-para-o-pstar-infinity-x)**

---

## 🇺🇸 English Version

### Overview

This repository contains a complete port of the **Motorola Camera4** system for the **PStar (Motorola Edge)** device, built for the **Infinity X ROM**. It includes device configurations, SEPolicy rules, vendor blobs, and proprietary libraries optimized for the `sm8250` chipset.

### 📋 Features

✅ **Complete Camera4 Integration** - Full Motorola Camera4 HAL implementation  
✅ **Device-Specific Configs** - PStar & SM8250 common configurations  
✅ **SEPolicy Rules** - 48+ SELinux policies for Motorola hardware  
✅ **Vendor Blobs** - All proprietary libraries and system extensions  
✅ **Easy Integration** - Patches or direct file copy methods  
✅ **Well-Documented** - Complete README in Portuguese & English  

### 📦 Repository Structure

```
├── device/motorola/
│   ├── pstar/                          # PStar device configs
│   │   ├── AndroidProducts.mk
│   │   ├── BoardConfig.mk
│   │   ├── device.mk
│   │   ├── infinity_pstar.mk
│   │   ├── proprietary-files.txt
│   │   └── vendor.prop
│   └── sm8250-common/                  # SM8250 common configs
│       ├── BoardConfigCommon.mk
│       └── common.mk
├── hardware/motorola/                  # Hardware SEPolicy (48 files)
│   ├── hal_camera_default.te
│   ├── hal_cameradesktop_default.te
│   ├── property.te
│   └── [... 45+ more SEPolicy files ...]
├── vendor/motorola/pstar/              # Vendor blobs & properties
│   ├── Android.bp
│   ├── Android.mk
│   ├── BoardConfigVendor.mk
│   ├── pstar-vendor.mk
│   └── proprietary/                    # ⭐ All APKs, libs, configs
│       ├── odm/
│       ├── product/
│       ├── system/
│       ├── system_ext/
│       └── vendor/
└── patches/                            # Alternative: Apply via patches
    ├── device-motorola-pstar.patch
    ├── device-motorola-sm8250-common.patch
    ├── hardware-motorola.patch
    └── vendor-motorola-pstar.patch
```

### 🚀 Installation Methods

#### **Method 1: Direct File Copy (Recommended)**

Fastest and most reliable method:

```bash
cd ~/Android/YourROM
cp -r ~/port_moto_camera4_pstar/device/* device/
cp -r ~/port_moto_camera4_pstar/hardware/* hardware/
cp -r ~/port_moto_camera4_pstar/vendor/* vendor/
```

#### **Method 2: Apply Patches**

If you have an existing ROM with different structure:

```bash
cd ~/Android/YourROM
patch -p1 < /path/to/port_moto_camera4_pstar/patches/device-motorola-pstar.patch
patch -p1 < /path/to/port_moto_camera4_pstar/patches/device-motorola-sm8250-common.patch
patch -p1 < /path/to/port_moto_camera4_pstar/patches/hardware-motorola.patch
patch -p1 < /path/to/port_moto_camera4_pstar/patches/vendor-motorola-pstar.patch
```

#### **Method 3: Automated Script**

```bash
chmod +x ~/port_moto_camera4_pstar/apply-patches.sh
~/port_moto_camera4_pstar/apply-patches.sh ~/Android/YourROM
```

### 📊 Contents Summary

| Component | Files | Size | Purpose |
|-----------|-------|------|---------|
| Device Configs | 6 | ~50 KB | PStar board configuration |
| SM8250 Common | 2 | ~20 KB | Common SM8250 settings |
| SEPolicy | 48 | ~200 KB | Hardware security policies |
| Vendor Blobs | 200+ | ~588 MB | Proprietary libraries & APKs |
| Patches | 4 | ~123 KB | Diff files for integration |

### 🔧 Requirements

- **AOSP Base**: Lineage OS 23 or compatible
- **Chipset**: Qualcomm SM8250 (PStar/Motorola Edge)
- **Device**: Motorola Edge (PStar) or similar SM8250 variants
- **Build Target**: `infinity_pstar` or compatible target

### 🎯 What's Included in Proprietary

- ✅ **Camera HAL** - MotCamera3, MotCamera4 with AI features
- ✅ **Camera Libs** - libarcsoft_faceid, libarcsoftbase, mpbase
- ✅ **APKs** - Camera3AI, camera extensions, face unlock
- ✅ **System Apps** - Signature apps, MotoDesktop, GameMode
- ✅ **Frameworks** - Motorola custom framework JARs
- ✅ **SEPolicy** - SELinux type enforcement rules
- ✅ **Permissions** - XML permission and capability definitions
- ✅ **Configs** - Media profiles, audio effects, thermal configs

### ⚙️ Post-Installation

After copying files:

1. **Run Full Build**:
   ```bash
   cd ~/Android/YourROM
   source build/envsetup.sh
   lunch infinity_pstar-userdebug
   m -j$(nproc) 2>&1 | tee build.log
   ```

2. **Flash to Device**:
   ```bash
   fastboot flashall -w
   ```

3. **Verify Camera4**:
   - Open Camera app
   - Check Settings > About Phone > Camera
   - Should show Motorola Camera4 AI

### 🐛 Troubleshooting

| Issue | Solution |
|-------|----------|
| **Build fails: Android.bp errors** | Run `m android_bp_verify` and check syntax |
| **Camera app crashes** | Verify all HAL libraries are present in vendor partition |
| **SELinux denials** | Check `logcat` for sepolicy issues, may need custom rules |
| **Missing blobs** | Ensure `proprietary/` folder is completely copied |
| **Patch conflicts** | Use Method 1 (direct copy) instead of patches |
| **Front/rear video with stabilization** | This is the only known limitation: recording with stabilization enabled can produce noise and a bluish tint |

### 📝 Build Statistics

Generated from InfinityX ROM:
- **Device Patches**: 196 lines changed
- **SM8250 Patches**: 48 lines changed  
- **Hardware Patches**: 28 lines changed
- **Vendor Patches**: 1243 lines changed
- **Total Changes**: 1515 lines

### 🔗 References

- [Lineage OS Documentation](https://wiki.lineageos.org/)
- [AOSP Camera Framework](https://source.android.com/devices/camera)
- [SELinux Documentation](https://selinuxproject.org/)
- [Motorola Android Documentation](https://motorola.com/)

### 📄 License

This port includes proprietary Motorola files. Usage is subject to:
- Motorola proprietary license
- AOSP license (for open-source components)
- Your device warranty terms

### 👤 Credits

- **Maintainer**: VotikaBr
- **ROM**: Infinity X ROM Project
- **Device**: Motorola Edge (PStar)
- **Original**: Motorola Mobility Inc.

### 📞 Support

For issues or questions:
- GitHub Issues: [Create an issue](https://github.com/VotikaBr/port_moto_camera4_pstar/issues)
- Check existing documentation
- Review build logs carefully

### 🤝 Contributing

Pull requests are welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Test thoroughly
4. Submit with clear commit messages

---

---

## 🇧🇷 Versão em Português

### Visão Geral

Este repositório contém um **port completo da Motorola Camera4** para o dispositivo **PStar (Motorola Edge)**, desenvolvido para a **ROM Infinity X**. Inclui configurações de device, regras SEPolicy, blobs do vendor e bibliotecas proprietárias otimizadas para o chipset `sm8250`.

### 📋 Características

✅ **Integração Completa do Camera4** - Implementação total do HAL da Motorola Camera4  
✅ **Configs Específicas do Device** - Configurações do PStar e SM8250 comum  
✅ **Regras SEPolicy** - 48+ políticas SELinux para hardware Motorola  
✅ **Blobs do Vendor** - Todas as bibliotecas proprietárias e extensões do sistema  
✅ **Integração Fácil** - Métodos de patch ou cópia direta de arquivos  
✅ **Bem Documentado** - README completo em Português e Inglês  

### 📦 Estrutura do Repositório

```
├── device/motorola/
│   ├── pstar/                          # Configs do device PStar
│   │   ├── AndroidProducts.mk
│   │   ├── BoardConfig.mk
│   │   ├── device.mk
│   │   ├── infinity_pstar.mk
│   │   ├── proprietary-files.txt
│   │   └── vendor.prop
│   └── sm8250-common/                  # Configs comuns SM8250
│       ├── BoardConfigCommon.mk
│       └── common.mk
├── hardware/motorola/                  # SEPolicy de Hardware (48 arquivos)
│   ├── hal_camera_default.te
│   ├── hal_cameradesktop_default.te
│   ├── property.te
│   └── [... 45+ arquivos SEPolicy ...]
├── vendor/motorola/pstar/              # Blobs do vendor e propriedades
│   ├── Android.bp
│   ├── Android.mk
│   ├── BoardConfigVendor.mk
│   ├── pstar-vendor.mk
│   └── proprietary/                    # ⭐ Todos os APKs, libs e configs
│       ├── odm/
│       ├── product/
│       ├── system/
│       ├── system_ext/
│       └── vendor/
└── patches/                            # Alternativa: Aplicar via patches
    ├── device-motorola-pstar.patch
    ├── device-motorola-sm8250-common.patch
    ├── hardware-motorola.patch
    └── vendor-motorola-pstar.patch
```

### 🚀 Métodos de Instalação

#### **Método 1: Cópia Direta de Arquivos (Recomendado)**

Método mais rápido e confiável:

```bash
cd ~/Android/SuaROM
cp -r ~/port_moto_camera4_pstar/device/* device/
cp -r ~/port_moto_camera4_pstar/hardware/* hardware/
cp -r ~/port_moto_camera4_pstar/vendor/* vendor/
```

#### **Método 2: Aplicar Patches**

Se você tiver uma ROM existente com estrutura diferente:

```bash
cd ~/Android/SuaROM
patch -p1 < /caminho/para/port_moto_camera4_pstar/patches/device-motorola-pstar.patch
patch -p1 < /caminho/para/port_moto_camera4_pstar/patches/device-motorola-sm8250-common.patch
patch -p1 < /caminho/para/port_moto_camera4_pstar/patches/hardware-motorola.patch
patch -p1 < /caminho/para/port_moto_camera4_pstar/patches/vendor-motorola-pstar.patch
```

#### **Método 3: Script Automático**

```bash
chmod +x ~/port_moto_camera4_pstar/apply-patches.sh
~/port_moto_camera4_pstar/apply-patches.sh ~/Android/SuaROM
```

### 📊 Resumo do Conteúdo

| Componente | Arquivos | Tamanho | Propósito |
|-----------|----------|--------|----------|
| Configs Device | 6 | ~50 KB | Configuração da placa PStar |
| SM8250 Comum | 2 | ~20 KB | Configurações comuns SM8250 |
| SEPolicy | 48 | ~200 KB | Políticas de segurança |
| Blobs Vendor | 200+ | ~588 MB | Bibliotecas proprietary & APKs |
| Patches | 4 | ~123 KB | Arquivos de diferença |

### 🔧 Requisitos

- **Base AOSP**: Lineage OS 23 ou compatível
- **Chipset**: Qualcomm SM8250 (PStar/Motorola Edge)
- **Device**: Motorola Edge (PStar) ou variantes SM8250 similares
- **Target de Build**: `infinity_pstar` ou alvo compatível

### 🎯 O que está Incluído no Proprietary

- ✅ **Camera HAL** - MotCamera3, MotCamera4 com recursos de IA
- ✅ **Libs Camera** - libarcsoft_faceid, libarcsoftbase, mpbase
- ✅ **APKs** - Camera3AI, camera extensions, face unlock
- ✅ **Apps de Sistema** - Apps Signature, MotoDesktop, GameMode
- ✅ **Frameworks** - JARs customizados do framework Motorola
- ✅ **SEPolicy** - Regras SELinux type enforcement
- ✅ **Permissões** - Definições XML de permissões e capacidades
- ✅ **Configs** - Perfis de mídia, efeitos de áudio, thermal configs

### ⚙️ Pós-Instalação

Após copiar os arquivos:

1. **Executar Build Completo**:
   ```bash
   cd ~/Android/SuaROM
   source build/envsetup.sh
   lunch infinity_pstar-userdebug
   m -j$(nproc) 2>&1 | tee build.log
   ```

2. **Flashear no Device**:
   ```bash
   fastboot flashall -w
   ```

3. **Verificar Camera4**:
   - Abrir app de Câmera
   - Verificar Configurações > Sobre o Telefone > Câmera
   - Deve mostrar Motorola Camera4 AI

### 🐛 Solução de Problemas

| Problema | Solução |
|----------|---------|
| **Build falha: erros Android.bp** | Execute `m android_bp_verify` e verifique sintaxe |
| **App da câmera trava** | Verifique se todas as libs HAL estão presentes na partição vendor |
| **Denials SELinux** | Verifique `logcat` para problemas de sepolicy, pode precisar regras customizadas |
| **Gravação frontal/traseira com estabilização** | Este é o único ponto conhecido que não funciona: com a estabilização ativada, a gravação pode gerar chiado e cor azulada |
| **Blobs faltando** | Garanta que a pasta `proprietary/` foi completamente copiada |
| **Conflitos de patch** | Use Método 1 (cópia direta) ao invés de patches |

### 📝 Estatísticas de Build

Gerado a partir da ROM InfinityX:
- **Device Patches**: 196 linhas alteradas
- **SM8250 Patches**: 48 linhas alteradas
- **Hardware Patches**: 28 linhas alteradas
- **Vendor Patches**: 1243 linhas alteradas
- **Total de Mudanças**: 1515 linhas

### 🔗 Referências

- [Documentação Lineage OS](https://wiki.lineageos.org/)
- [Framework de Câmera AOSP](https://source.android.com/devices/camera)
- [Documentação SELinux](https://selinuxproject.org/)
- [Documentação Motorola Android](https://motorola.com/)

### 📄 Licença

Este port inclui arquivos proprietários da Motorola. O uso está sujeito a:
- Licença proprietária Motorola
- Licença AOSP (para componentes de código aberto)
- Termos de garantia do seu dispositivo

### 👤 Créditos

- **Mantenedor**: VotikaBr
- **ROM**: Projeto Infinity X ROM
- **Device**: Motorola Edge (PStar)
- **Original**: Motorola Mobility Inc.

### 📞 Suporte

Para dúvidas ou problemas:
- GitHub Issues: [Criar uma issue](https://github.com/VotikaBr/port_moto_camera4_pstar/issues)
- Verificar documentação existente
- Revisar logs de build cuidadosamente

### 🤝 Contribuindo

Pull requests são bem-vindos! Por favor:
1. Faça fork do repositório
2. Crie uma branch de feature
3. Teste completamente
4. Envie com mensagens de commit claras

---

**Last Updated**: May 13, 2026  
**Status**: Active Development  
**Maintained by**: VotikaBr  
**Repository**: https://github.com/VotikaBr/port_moto_camera4_pstar
