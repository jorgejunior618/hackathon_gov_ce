import 'package:easy_mask/easy_mask.dart';
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:transparencia_gov_ce/styles/material_styles.dart";
import "package:transparencia_gov_ce/widgets/typography.dart";

class Input extends StatelessWidget {
  const Input({
    Key? key,
    this.placeholder = "",
    this.suffixIcon,
    this.prefixIcon,
    this.disabled = false,
    this.password = false,
    this.onTap,
    this.filled,
    this.fillColor,
    this.textColor = Colors.black,
    this.enabledBorderColor = MaterialColors.muted,
    this.focusedBorderColor = MaterialColors.primary,
    this.cursorColor = MaterialColors.muted,
    this.hintTextColor = MaterialColors.muted,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.outlineBorder = false,
    this.autofocus = false,
    this.borderColor = MaterialColors.border,
    this.inputMask,
    required this.controller,
    this.validator,
    this.onEditingComplete,
    this.textInputAction = TextInputAction.done,
    this.label,
    this.readOnly = false,
  }) : super(key: key);

  /// 9: r"[0-9]
  ///
  /// A: r"[a-zA-Z]
  ///
  /// N: r"[0-9a-zA-Z]
  ///
  /// X: qualquer caractere
  ///
  ///
  /// Apenas uma [String] para uma máscara padrão ou
  /// uma Lista para mais de um tamanhos de entrada
  final dynamic inputMask;

  /// Função que validará, ao enviar o form, se a entrada do usuário
  /// está de acordo com o esperado
  ///
  /// Deve retornar uma [String] informando o erro da entrada
  /// ou [null] caso não haja erro
  final String? Function(String? value)? validator;
  final Function()? onEditingComplete;
  final TextInputAction textInputAction;

  final String placeholder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool disabled;
  final bool password;
  final Function()? onTap;
  final Function(String value)? onChanged;
  final TextEditingController controller;
  final bool autofocus;
  final Color borderColor;
  final bool? filled;
  final Color? fillColor;
  final Color textColor;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final bool outlineBorder;
  final Color cursorColor;
  final Color hintTextColor;
  final TextInputType keyboardType;
  final String? label;
  final bool readOnly;

  double get marginBottom {
    if (outlineBorder) {
      return prefixIcon != null || suffixIcon != null ? 15 : 20;
    } else if (prefixIcon != null || suffixIcon != null) {
      return label != null ? 14 : 9;
    } else {
      return label != null ? 13 : 15;
    }
  }

  @override
  Widget build(BuildContext context) {
    TextInputMask? maskFormatter;
    if (inputMask != null) {
      maskFormatter = TextInputMask(
        mask: inputMask,
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
      child: TextFormField(
        readOnly: readOnly,
        onEditingComplete: onEditingComplete,
        textInputAction: textInputAction,
        validator: validator ??
            (value) {
              return null;
            },
        obscureText: password,
        enabled: !disabled,
        cursorColor: cursorColor,
        onTap: onTap,
        inputFormatters: maskFormatter != null ? [maskFormatter] : [],
        onChanged: onChanged,
        controller: controller,
        autofocus: autofocus,
        keyboardType: keyboardType,
        style: TextStyle(
          height: 1.0, //.85,
          fontSize: 16.0,
          color: textColor,
        ),
        textAlignVertical: const TextAlignVertical(y: 0.5),
        decoration: InputDecoration(
          focusedErrorBorder: outlineBorder
              ? const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.5),
                )
              : const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.5),
                ),
          errorBorder: outlineBorder
              ? const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.5),
                )
              : const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.5),
                ),
          labelText: label,
          contentPadding: const EdgeInsets.only(left: 16, bottom: 15),
          filled: filled,
          fillColor: fillColor,
          labelStyle: TextStyle(
            color: hintTextColor,
          ),
          hintStyle: TextStyle(
            color: hintTextColor,
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          disabledBorder: outlineBorder
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: enabledBorderColor),
                )
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: enabledBorderColor),
                ),
          enabledBorder: outlineBorder
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: enabledBorderColor),
                )
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: enabledBorderColor),
                ),
          focusedBorder: outlineBorder
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: focusedBorderColor),
                )
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: focusedBorderColor),
                ),
          hintText: placeholder,
        ),
      ),
    );
  }
}

class InputDate extends StatelessWidget {
  const InputDate({
    Key? key,
    required this.controller,
    required this.setController,
    this.label = "",
    required this.dataInicial,
    required this.dataMaxima,
    this.obrigatorio = false,
    this.onTap,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final bool obrigatorio;
  final DateTime dataInicial;
  final DateTime dataMaxima;
  final Function(DateTime data) setController;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () async {
          onTap!();

          DateTime? data = await showDatePicker(
            context: context,
            helpText: "Selecionar $label",
            initialDate: dataInicial,
            firstDate: DateTime(1900),
            lastDate: dataMaxima,
            locale: const Locale("pt", "BR"),
          );

          if (data != null) setController(data);
        },
        child: Input(
          label: label,
          disabled: true,
          suffixIcon: const Icon(Icons.date_range),
          textInputAction: TextInputAction.next,
          controller: controller,
          validator: obrigatorio
              ? (value) {
                  if (value == null || value.length != 10) {
                    return "Por favor, preencher este campo";
                  }
                  return null;
                }
              : (v) => null,
        ),
      ),
    );
  }
}

class InputSenha extends StatefulWidget {
  const InputSenha(
    this.controller, {
    Key? key,
    this.onEditingComplete,
    this.label = "",
    this.placeholder = "",
    this.confirmacao = false,
    this.senhaComparacao = "",
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final Function(String value)? onChanged;
  final String label;
  final String placeholder;
  final bool confirmacao;
  final String senhaComparacao;

  @override
  _InputSenhaState createState() => _InputSenhaState();
}

class _InputSenhaState extends State<InputSenha> {
  bool _senhaVisivel = false;

  @override
  Widget build(BuildContext context) {
    return Input(
      label: widget.label,
      onTap: widget.onTap ?? () {},
      placeholder: widget.placeholder,
      password: !_senhaVisivel,
      onChanged: (value) => widget.onChanged!(value),
      suffixIcon: InkWell(
        splashColor: MaterialColors.primary,
        onTap: () {
          setState(() {
            _senhaVisivel = !_senhaVisivel;
          });
        },
        child: Icon(
          _senhaVisivel ? Icons.visibility_off : Icons.visibility,
          semanticLabel: "${_senhaVisivel ? "Visualizar" : "Esconder"} senha",
        ),
      ),
      textInputAction: TextInputAction.next,
      onEditingComplete: widget.onEditingComplete,
      keyboardType: TextInputType.text,
      controller: widget.controller,
      validator: (value) {
        // print("   - NOVA SENHA: ${widget.senhaComparacao}");
        // print("   - CONFIRMAÇÂO: ${widget.controller.text}");
        if (!widget.confirmacao) {
          if (value == null || value.isEmpty) {
            return "Por favor, preencher este campo";
          }
          if (value.length < 6 || value.length > 8) {
            return "A senha deve conter de 6 a 8 caracteres";
          }
          if (!(value.contains(RegExp(r"[A-Z]")) &&
              value.contains(RegExp(r"[0-9]")) &&
              value.contains(RegExp(r"[a-z]")))) {
            return "Utilize maiúsculas, minúsculas e números";
          }
          return null;
        } else {
          if (value == null || value.isEmpty) {
            return "Por favor, preencher este campo";
          }
          if (value.compareTo(widget.senhaComparacao) != 0) {
            return "Confirmação diferente da senha";
          }
          return null;
        }
      },
    );
  }
}

class SelectDropDown extends StatelessWidget {
  const SelectDropDown({
    Key? key,
    required this.controller,
    this.list = const [],
    required this.onChange,
    this.hintText = "",
    this.margin,
    this.desabilitado = false,
    this.unicoNaLinha = true,
    this.onTap,
    this.icon = const Icon(Icons.keyboard_arrow_right),
    this.borderOutlined = false,
    this.underline = true,
    this.mostrarLabel = false,
  }) : super(key: key);

  final String controller;
  final String hintText;
  final List list;
  final Function(String? newValue)? onChange;
  final Function()? onTap;
  final EdgeInsetsGeometry? margin;
  final bool desabilitado;
  final bool unicoNaLinha;
  final bool mostrarLabel;
  final Icon icon;
  final bool borderOutlined;

  ///informe somente se optar pelo [borderOutlineD: false]
  final bool underline;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(top: 8, bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: desabilitado ? Colors.grey.withOpacity(0.2) : Colors.transparent,
        borderRadius: borderOutlined ? BorderRadius.circular(4) : null,
        border: borderOutlined
            ? Border.all(color: MaterialColors.muted)
            : underline
                ? const Border(bottom: BorderSide())
                : null,
      ),
      child: DropdownButton<String>(
        value: controller,
        onTap: onTap ?? () {},
        icon: icon,
        iconSize: 24,
        elevation: 16,
        focusColor: MaterialColors.primary,
        hint: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              hintText,
              style: TextStyle(
                color: desabilitado
                    ? MaterialColors.muted
                    : Colors.black.withOpacity(0.6),
              ),
            ),
          ),
        ),
        isExpanded: unicoNaLinha,
        underline: Container(
          height: 0,
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.all(0),
        ),
        onChanged: onChange,
        selectedItemBuilder: (BuildContext context) {
          return list
              .map((value) =>
                  value is Map ? value["nome"] ?? value["Nome"] : value)
              .map<Widget>((item) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (mostrarLabel)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: SimpleText(
                        hintText,
                        textSize: 12,
                        textColor: MaterialColors.muted,
                      ),
                    ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: mostrarLabel ? 8.0 : 0.0),
                    child: SimpleTextBold(
                      item,
                      textColor: MaterialColors.primary,
                    ),
                  ),
                ],
              ),
            );
          }).toList();
        },
        items: list
            .map((value) => value is Map
                ? (value["nome"] ?? value["Nome"]) +
                    "--${value["id"] ?? value["ID"] ?? value["Id"]}"
                : value + "--0")
            .map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              padding: const EdgeInsets.only(bottom: 4),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: MaterialColors.muted.withOpacity(0.5),
                    width: 1,
                  ),
                ),
              ),
              child: SimpleText(
                value.split("--")[0],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
