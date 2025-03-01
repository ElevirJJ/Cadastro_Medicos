package med.voll.api.domain.medico;

import med.voll.api.domain.endereco.Endereco;

public record DadosListagemMedico(Long id, String nome, String telefone, String email, String crm, Especialidade especialidade, Endereco endereco) {

    public DadosListagemMedico(Medico medico) {
        this(medico.getId(), medico.getNome(), medico.getTelefone(), medico.getEmail(), medico.getCrm(), medico.getEspecialidade(), medico.getEndereco());
    }

}
