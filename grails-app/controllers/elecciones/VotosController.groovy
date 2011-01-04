package elecciones

class VotosController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [votosInstanceList: Votos.list(params), votosInstanceTotal: Votos.count()]
    }

    def create = {
        def votosInstance = new Votos()
        votosInstance.properties = params
        return [votosInstance: votosInstance]
    }

    def save = {
        def votosInstance = new Votos(params)
        if (votosInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'votos.label', default: 'Votos'), votosInstance.id])}"
            redirect(action: "show", id: votosInstance.id)
        }
        else {
            render(view: "create", model: [votosInstance: votosInstance])
        }
    }

    def show = {
        def votosInstance = Votos.get(params.id)
        if (!votosInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'votos.label', default: 'Votos'), params.id])}"
            redirect(action: "list")
        }
        else {
            [votosInstance: votosInstance]
        }
    }

    def edit = {
        def votosInstance = Votos.get(params.id)
        if (!votosInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'votos.label', default: 'Votos'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [votosInstance: votosInstance]
        }
    }

    def update = {
        def votosInstance = Votos.get(params.id)
        if (votosInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (votosInstance.version > version) {
                    
                    votosInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'votos.label', default: 'Votos')] as Object[], "Another user has updated this Votos while you were editing")
                    render(view: "edit", model: [votosInstance: votosInstance])
                    return
                }
            }
            votosInstance.properties = params
            if (!votosInstance.hasErrors() && votosInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'votos.label', default: 'Votos'), votosInstance.id])}"
                redirect(action: "show", id: votosInstance.id)
            }
            else {
                render(view: "edit", model: [votosInstance: votosInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'votos.label', default: 'Votos'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def votosInstance = Votos.get(params.id)
        if (votosInstance) {
            try {
                votosInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'votos.label', default: 'Votos'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'votos.label', default: 'Votos'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'votos.label', default: 'Votos'), params.id])}"
            redirect(action: "list")
        }
    }
}
